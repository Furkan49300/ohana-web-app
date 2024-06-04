import 'package:carousel_slider/carousel_slider.dart';
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
import 'package:ohana_webapp_flutter/presentation/pages/servicesPage/services_banner.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_carousel.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_text_content.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_text_card.dart';

class SingleServicePageLargeScreen extends StatelessWidget {
  const SingleServicePageLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, navBarHeight),
        child: const NavigationBarContentsLargeScreen(),
      ),
      body: Expanded(
        child: SizedBox(
            width: screenSize.width,
            child: Stack(
              children: [
                // CONTENT
                GestureDetector(
                  onTap: () {
                    context.read<DropdownMenuBloc>().add(HideMenuEvent());
                  },
                  child: SingleChildScrollView(
                    child: _content(screenSize, context),
                  ),
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
            )),
      ),
    );
  }

  _content(Size screenSize, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ServicesBanner(
          title: 'Dev services',
          imagePath:
              'assets/services_images/dev_services/Custom-Development-highress.png',
          text:
              'Nous proposons différent types de services de développement et de cybersécurité, Nous n\'hésitons pas à mettre notre coeur à l\'ouvrage car le développement est avant tout une activité qui nous passionne et nous voulons faire profiter de cette passion à tout nos clients et potentiel client',
        ),
        _getTextCustomCard(),
        Image.asset(
          'assets/services_images/services_acceuil_official_free_image.webp',
          height: 400,
        ),
        const SizedBox(
          height: 10,
        ),
        _getCatalogList(),
        // const SizedBox(
        //   height: 10,
        // ),
        FooterLargeScreen(mediaScreenWidth: screenSize.width)
      ],
    );
  }

//TEXT BODY
  _getTextCustomCard({bool reverseMode = false}) {
    TextDirection rtlDirection = TextDirection.rtl;
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        const CustomTextCard(
            image: 'assets/services_images/dev_services/dev_exmple.jpg',
            title: 'How to Design'),
        CustomTextCard(
            image: 'assets/services_images/dev_services/webTesting.jpg',
            textDirection: rtlDirection,
            title: 'Wires connection'),
        const CustomTextCard(
            image: 'assets/services_images/dev_services/webdesing.jpg',
            title: 'Digital Structure'),
      ],
    );
  }

  _getTextBloc({title = 'What will happen in the Future ?'}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: spaceLeftBigTitle),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 30,
          ),
          const CustomTextContent(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            boldTextList: [''],
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  _getVideo() {
    // return const DirectVideoAtom();
  }

//CATALOG LIST
  _getCatalogList() {
    double height = 316;
    double width = 616;
    List<Widget> devServices = [
      _getCatalogItem(title: 'SITE VITRINE', imagePath: 'webshowcases.jpg'),
      _getCatalogItem(title: 'SITE E-COMMERCE', imagePath: 'e-commerce.jpg'),
      _getCatalogItem(title: 'LANDING PAGE', imagePath: 'landingPage.jpg'),
      _getCatalogItem(title: 'SITE SUR MESURE', imagePath: 'measurement.jpg'),
      _getCatalogItem(title: 'HEBERGEMENT', imagePath: 'accomodation.jpg'),
      _getCatalogItem(title: 'MAINTENANCE', imagePath: 'maintain.jpg'),
      _getCatalogItem(title: 'RÉFÉRENCEMENT', imagePath: 'ref.jpg'),
      _getCatalogItem(
          title: 'MAKETING/PUBLICITES DIGITALES', imagePath: 'webpub.jpg'),
    ];

    return CustomCarousel(title: 'Catalogue', widgets: devServices);
  }

  _getCatalogItem({required String title, required String imagePath}) {
    double height = 316;
    double width = 616;
    return Padding(
        padding: const EdgeInsets.only(left: 70, bottom: 20),
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Image.asset(
                'assets/services_images/dev_services/catalog_images/$imagePath',
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
        ));
  }

//---------
}
