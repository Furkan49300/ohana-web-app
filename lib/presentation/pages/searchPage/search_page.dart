import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/blog_global_manager_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_state.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_screen_fit.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navbar_responsiveness.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/blog_card.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';

class SearchPageLargeScreen extends StatelessWidget {
  final List<DocumentSnapshot> searchResults;
  final String searchQuery;

  const SearchPageLargeScreen({
    super.key,
    this.searchResults = const [],
    this.searchQuery = '',
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavbarResponsiveness.getNavbar(screenSize.width),
      endDrawer: NavbarResponsiveness.getEndDrawer(screenSize.width),
      body: Stack(
        children: [
          // CONTENT
          GestureDetector(
            onTap: () {
              context.read<DropdownMenuBloc>().add(HideMenuEvent());
            },
            child: _content(screenSize, context),
          ),
          // NAVBAR MEGA-DROPDOWN MENUS
          const DropdownMenuExpertises(),
          const DropdownMenuOffers(),
          const DropdownMenuAboutUs(),
          //SEARCH BAR
          SearchNavBar(
            placeholder:
                "Cherchez une page, un service, un article, une offre d'emploi...",
          ),
        ],
      ),
    );
  }

  // Determine document type by checking the presence of specific fields
  String _getDocumentType(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    if (data != null) {
      if (data.containsKey('image') && data.containsKey('description')) {
        return 'article';
      } else if (data.containsKey('offer_content') &&
          data.containsKey('publish_date')) {
        return 'emploi';
      }
    }
    return 'unknown';
  }

  //CONTENT

  Widget _content(Size screenSize, BuildContext context) {
    // Filter results based on type
    final articleResults = searchResults
        .where((doc) => _getDocumentType(doc) == 'article')
        .toList();
    final emploiResults = searchResults
        .where((doc) => _getDocumentType(doc) == 'emploi')
        .toList();

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            CustomUnderlineTitle(
              title: 'Résultat pour "$searchQuery"',
              textWidth: 300,
            ),
            const SizedBox(height: 80),
            const Text(
              'Pages Correspondantes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Center(
              child: Wrap(
                spacing: 30,
                children: articleResults
                    .map<Widget>((doc) =>
                        _getMatchingPage(text: "Page <<${doc['title']}>>"))
                    .toList(),
              ),
            ),
            if (articleResults.isNotEmpty) ...[
              const SizedBox(height: 50),
              const Text(
                'Articles Correspondants',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              Center(
                child: Wrap(
                  spacing: 40,
                  children: articleResults
                      .map<Widget>((doc) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: BlogCard(
                                  width: 600,
                                  pathOfTopImage: doc['image'],
                                  title: doc['title'],
                                  date: doc['publish_date'].toString(),
                                  textAndBoldListMap: {
                                    "text": doc['description']
                                  },
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ],
            if (emploiResults.isNotEmpty) ...[
              const SizedBox(height: 50),
              const Text(
                'Emplois Correspondants',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              Center(
                child: Wrap(
                  spacing: 40,
                  children: emploiResults
                      .map<Widget>((doc) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Text(
                                        doc['title'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                          width: 400,
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Image(
                                              image: AssetImage(
                                                  doc['url_image']))),
                                      SizedBox(
                                        width: 400,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              padding: EdgeInsets.all(8),
                                              child: Text(doc['contract']),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              padding: EdgeInsets.all(8),
                                              child: Text(doc['duration']),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              padding: EdgeInsets.all(8),
                                              child: Text(doc['place']),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Button("Voir plus",
                                            type: ButtonType.standard,
                                            onTap: () {
                                          Navigator.of(context).pushNamed(
                                            '/carreer',
                                            arguments: doc,
                                          );
                                        }),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ],
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _getMatchingPage({required String text}) {
    return Container(
      color: purpleNeutral,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 370,
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(width: 0),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white)),
            child: const Text(
              'Voir plus',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
