import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_large_screen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navigation_bar_contents_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/blog_card.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/blog_card_pattern.dart';

class SearchPageLargeScreen extends StatelessWidget {
  const SearchPageLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(screenSize.width, navBarHeight),
          child: const NavigationBarContentsLargeScreen()),
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
          const SearchNavBar(
            placeholder:
                "Cherchez une page, un service, un article, une offre d'emploi...",
          )
        ],
      ),
    );
  }

//CONTENT

  _content(Size screenSize, context) {
    List blogListMap = [
      {
        'id': 1,
        'title':
            'Développez Votre Première Application Mobile en Flutter : Un Guide Pas à Pas',
        'imagePath': 'assets/blog_images/flutterCover.webp',
        'text':
            "Ce tutoriel vous guidera à travers le processus de développement d'une application mobile de base avec Flutter, y compris la configuration de l'environnement, la création d'une interface utilisateur et le déploiement de l'application. ",
        'boldTextList': [''],
        'date': '05/06/2024'
      },
      {
        'id': 2,
        'title':
            "Étude de Cas : Réussite de la Transformation Numérique de l'Entreprise ABC",
        'imagePath': 'assets/blog_images/UnArticleABC-720x544.png',
        'text':
            "Découvrez comment nous avons aidé l'entreprise ABC à transformer son site web en une plateforme numérique moderne, en améliorant l'expérience utilisateur et en augmentant les conversions de 30%.",
        'boldTextList': [''],
        'date': '06/06/2024'
      },
      {
        'id': 3,
        'title':
            "Optimisation SEO pour les Sites Web en 2024 : Ce Que Vous Devez Savoir",
        'imagePath': 'assets/blog_images/homepage-concept-with-search-bar.jpg',
        'text':
            "Dans cet article, nous partageons les dernières techniques de SEO pour aider votre site web à se classer plus haut dans les résultats de recherche en 2024. De l'optimisation des mots-clés à l'amélioration de la vitesse de chargement, nous couvrons tout.",
        'boldTextList': [''],
        'date': '07/06/2024'
      },
      {
        'id': 4,
        'title':
            "Interview avec Notre Expert en UX/UI : L'Importance d'une Bonne Expérience Utilisateur",
        'imagePath':
            'assets/blog_images/ui-ux-design-informations-actualites.jpg',
        'text':
            "Plongez dans l'importance de l'expérience utilisateur avec notre expert en UX/UI, qui partage ses idées sur les meilleures pratiques et les tendances à suivre pour créer des interfaces intuitives et engageantes",
        'boldTextList': [''],
        'date': '08/06/2024'
      },
    ];

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                const CustomUnderlineTitle(
                  title: 'Résultat pour ...',
                  textWidth: 300,
                ),
                const SizedBox(height: 80),
                const Text(
                  'Pages Correspondantes', // section for offers, services, ...
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                //MATCHING PAGES
                Center(
                  child: Wrap(
                    spacing: 30,
                    children: [
                      _getMatchingPage(
                          text: "Page <<Services de développement>>"),
                      _getMatchingPage(
                          text: "Page <<Services de développement>>"),
                      _getMatchingPage(
                          text: "Page <<Services de développement>>"),
                      _getMatchingPage(
                          text: "Page <<Services de développement>>"),
                      _getMatchingPage(
                          text: "Page <<Services de développement>>"),
                    ],
                  ),
                ),

                //MATCHING BLOG
                const SizedBox(height: 50),
                const Text(
                  'Articles Correspondants',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                Center(
                  child: Wrap(
                    spacing: 40,
                    children: blogListMap
                        .map((item) => Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: BlogCard(
                                  pathOfTopImage: item['imagePath'],
                                  textAndBoldListMap: {"text": item['text']},
                                  title: item['title'],
                                  date: item['date'],
                                  width: 600),
                            ))
                        .toList(),
                  ),
                ),
                const FooterLargeScreen(),
              ],
            )),
      ),
    );
  }

  _getMatchingPage({required String text}) {
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
          const SizedBox(
            width: 0,
          ),
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
