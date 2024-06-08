import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_large_screen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navigation_bar_contents_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/pages/aboutUsPages/carreersPage/widget/carreer_card.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/input_field/custom_input_field.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_smart_paginator.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';

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
              const SizedBox(height: 30),
              _getCarrersItems(),
              const SizedBox(height: 50),
              _getListNumber(),
              const SizedBox(height: 50),
              FooterLargeScreen(),
            ],
          ),
        ),
      ),
    );
  }

//BANNER
  _getBanner({required Size screenSize}) {
    return CustomBanner(
      imagePath: 'assets/offers_images/person-with-hiring-sign-by-window.jpg',
      widget: SizedBox(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //start at the start
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "REJOINDRE NOTRE EQUIPE ?",
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }

//get  svg of expertises
  _getExpertisesCards() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _getCustomExpertiseCard(
            svgPath: 'assets/services_icons/dev_services/devLogo.svg'),
        _getCustomExpertiseCard(
            svgPath: 'assets/services_icons/dev_services/design.svg'),
        _getCustomExpertiseCard(
            svgPath: 'assets/services_icons/dev_services/locked.svg'),
        _getCustomExpertiseCard(
            svgPath: 'assets/services_icons/dev_services/testValidate.svg'),
        _getCustomExpertiseCard(
            svgPath: 'assets/services_icons/dev_services/increase.svg'),
      ],
    );
  }

  _getCustomExpertiseCard({required String svgPath}) {
    Color color = Colors.black.withOpacity(0.5);
    double size = 30;
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(top: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(partialCircularItem),
        color: color,
      ),
      child: SvgPicture.asset(
        svgPath,
        height: size,
        width: size,
      ),
    );
  }

// OFFRES

  _getCarrersItems() {
    List listOfOffers = [
      {
        'title': 'Développeur React',
        'image': 'assets/offers_images/React-Developer-Tools.png',
        'keyWords': ['île de France', 'Stage', '2 mois'],
        'date': '15 Mai 2025',
      },
      {
        'title': 'Designer UI',
        'image':
            'assets/offers_images/original-a76def72cdea25d560956e824f479901.png',
        'keyWords': ['île de France', 'Stage', '2 mois'],
        'date': '15 Mai 2025',
        'alert': 'Cette offres à expirée il y a deux jours ',
        'description': '',
      },
      {
        'title': 'Gestionnaire du réseuax',
        'image': 'assets/offers_images/conception-reseaux__1100.jpg',
        'keyWords': ['île de France', 'Stage', '2 mois'],
        'date': '15 Mai 2025',
        'description': '',
      },
      {
        'title': 'Développeur mobile flutter',
        'image':
            'assets/offers_images/avntages-inconvennients-flutter-application-mobile-hybride_banner.jpg',
        'keyWords': ['Afrique', 'CDI', '2 mois'],
        'date': '15 Mai 2025',
        'description': '',
        'alert': 'Cette offres a expirée',
      },
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (Map items
            in listOfOffers) //LIST_OF_OFFERS is inside widget_utils.dart doc
          CustomCarreerCard(
            title: items['title'],
            keyWords: items['keyWords'],
            imagePath: items['image'],
            date: items['date'],
            alert: items['alert'],
            onTap: () {},
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
