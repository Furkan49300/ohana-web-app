import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_large_screen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navigation_bar_contents_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/blog_card.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/custom_input_field.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_painter.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_smart_paginator.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/expertises_card.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/circular_text_overlay.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_carousel.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_popup.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/strong_points_section.dart';

class CarreersPageLargeScreen extends StatelessWidget {
  const CarreersPageLargeScreen({super.key});

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
        ));
  }

  _content(Size screenSize, context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _getBanner(screenSize: screenSize),
              const SizedBox(height: 5),
              _getOffersItems(),
              const SizedBox(height: 50),
              _getListNumber(),
              const SizedBox(height: 50),
              FooterLargeScreen(mediaScreenWidth: screenSize.width),
            ],
          ),
        ),
      ),
    );
  }

//BANNER
  _getBanner({required Size screenSize}) {
    return Stack(
      children: [
        const CustomBanner(imagePath: ''),
        SizedBox(
            // width: mediaScreenWidth,
            // height: ImageDimensionType
            //     .defaultCarouselImage.heightVal, //Container Height
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end, //start at the start
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "TROUVER COMMENT PARTICIPER AVEC NOUS",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const CustomInputField(placeholder: 'Chercher une offres'),
                const SizedBox(
                  width: 10,
                ),
                Button("RECHERCHER", type: ButtonType.standard, onTap: () {}),
              ],
            ),
            _getExpertisesCards(),
            const SizedBox(height: 100),
          ],
        )),
      ],
    );
  }

//get  svg of expertises
  _getExpertisesCards() {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExpertisesCard(svgLink: 'devLogo.svg'),
        ExpertisesCard(svgLink: 'design.svg'),
        ExpertisesCard(svgLink: 'locked.svg'),
        ExpertisesCard(svgLink: 'ref.svg'),
        ExpertisesCard(svgLink: 'testValidate.svg'),
        ExpertisesCard(svgLink: 'increase_model2.svg'),
      ],
    );
  }

// OFFRES
  _getOffersItems() {
    List listOfOffers = [
      {
        'title': 'Développeur React',
        'image': 'devReact.jpeg',
        'keyWords': ['île de France', 'Stage', '2 mois'],
        'date': '15 Mai 2025',
        'popup': ''
      },
      {
        'title': 'Designer UI',
        'image': 'Cover.jpg',
        'keyWords': ['île de France', 'Stage', '2 mois'],
        'date': '15 Mai 2025',
        'popup': 'this is a simple PopUp',
        'description': '',
      },
      {
        'title': 'Gestionnaire du réseuax',
        'image': 'reseau.jpg',
        'keyWords': ['île de France', 'Stage', '2 mois'],
        'date': '15 Mai 2025',
        'popup': '',
        'description': '',
      },
      {
        'title': 'Développeur mobile flutter',
        'image': 'phone1.jpg',
        'keyWords': ['Afrique', 'CDI', '2 mois'],
        'date': '15 Mai 2025',
        'popup': '',
        'description': '',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (Map items
            in listOfOffers) //LIST_OF_OFFERS is inside widget_utils.dart doc
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 2 * spaceLeftBigTitle),
                Stack(
                  children: [
                    Container(
                        width: 1000,
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.6),
                            borderRadius:
                                BorderRadius.circular(partialCircularItem)),
                        child: _getCard(
                            title: items['title'],
                            keyWords: items['keyWords'],
                            imageLink: items['image'],
                            date: items['date'])),
                    //button see more
                    Positioned(
                        right: 30,
                        bottom: 30,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(partialCircularItem),
                          child: Button(
                            'Voir l\'offre',
                            type: ButtonType.standard,
                            paddingLeftRight: 15.0,
                            paddingTopBottom: 15.0,
                            onTap: () {},
                          ),
                        )),
                  ],
                ),
                const SizedBox(width: 10),
                if (items['popup'] != '') CustomPopup(text: items['popup']),
              ],
            ),
          ),
      ],
    );
  }

  _getCard({title, keyWords, imageLink, date}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(partialCircularItem),
              bottomLeft: Radius.circular(partialCircularItem)),
          child: Image.asset(
            imageLink,
            height: 220,
            width: 170,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 30), //space between image and title
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 20, left: 0),
                      child: Wrap(spacing: 10, children: [
                        for (var item in keyWords)
                          Button(
                            item,
                            type: ButtonType.gray,
                            onTap: () {},
                          ),
                      ]))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 25),
              )
            ],
          ),
        )
      ],
    );
  }

//NUMBER LIST

  _getListNumber() {
    return CustomSmartPaginator(
      startIndicator: 1,
      endIndicator: 4,
      onTap: () {},
    );
  }

//---------
}
