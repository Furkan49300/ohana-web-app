import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:ohana_webapp_flutter/presentation/widgets/composants/carousel.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_icon_button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_text_content.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_underlined_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/strong_points_section.dart';

class ServicesPageLargeScreen extends StatelessWidget {
  const ServicesPageLargeScreen({super.key});

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
        child: SingleChildScrollView(
          child: SizedBox(
              width: screenSize.width,
              child: Stack(
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
              )),
        ),
      ),
    );
  }

  _content(screenSize, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _getBanner(),
        const SizedBox(
          height: 60,
        ),
        const ServicesBLoc(),
        const SizedBox(
          height: 40,
        ),
        const StrongPointsSection(),
        const SizedBox(
          height: 70,
        ),
        FooterLargeScreen(mediaScreenWidth: screenSize.width)
      ],
    );
  }

  _getBanner() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const CustomBanner(
            imagePath:
                'assets/homepage_image/programming_code_abstract_tech_background.jpg'),
        Positioned(
          bottom: -110,
          child: Container(
            padding: const EdgeInsets.only(
              left: spaceLeftBigTitle / 2,
              right: spaceLeftBigTitle / 2,
              top: 10,
            ),
            width: 990,
            height: 300,
            color: Colors.white,
            child: const Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: CustomUnderlineTitle(
                      title: 'Nos Services',
                      lineColor: Colors.purple,
                    )),
                SizedBox(
                  height: 10,
                ),
                CustomTextContent(
                  text:
                      'Nous proposons différent types de services de développement et de cybersécurité, Nous n\'hésitons pas à mettre notre coeur à l\'ouvrage car le développement est avant tout une activité qui nous passionne et nous voulons faire profiter de cette passion à tout nos clients et potentiel client',
                  boldTextList: ['développement', 'cybersécurité'],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

//-----SERVICES BLOC

class ServicesBLoc extends StatelessWidget {
  const ServicesBLoc({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> devServices = [
      _getSingleServiceItem(
          'dev_icons/devLogo.svg', 'DÉVELOPPEMENT WEB', 'devWeb.jpg'),
      _getSingleServiceItem(
          'dev_icons/software-developer-work-on-computer-programmer-coder-svgrepo-com.svg',
          'LOGICIELS',
          'logiciel.jpg'),
      _getSingleServiceItem('dev_icons/design.svg', 'DESIGN', 'webdesing.jpg'),
      _getSingleServiceItem(
          'dev_icons/locked.svg', 'CYBERSECURITÉ', 'cyber.jpg'),
      _getSingleServiceItem('dev_icons/ref.svg', 'RÉFÉRENCEMENT', 'ref.jpg'),
      _getSingleServiceItem(
          'dev_icons/testValidate.svg', 'TESTING', 'webTesting.jpg'),
      _getSingleServiceItem(
          'dev_icons/increase_model2.svg', 'IA GENERATIVE', 'ia.jpg'),
    ];
    List<Widget> cybersecurity = [
      _getSingleServiceItem('cyber_services/audit-report-svgrepo-com.svg',
          'AUDIT DE SECURITE', 'audit.jpg'),
      _getSingleServiceItem('cyber_services/trace-svgrepo-com.svg',
          'AUDIT DE VULNERABILITE', 'vulnerability.jpg'),
      _getSingleServiceItem('cyber_services/rules-svgrepo-com.svg',
          'AUDIT DE CONFORMITE', 'compliance.jpg'),
      _getSingleServiceItem('cyber_services/testing-web-design-svgrepo-com.svg',
          'PENTESTING', 'pentesting.jpg'),
      _getSingleServiceItem('cyber_services/team-work-svgrepo-com.svg',
          'ACCOMPAGNEMENT EQUIPE', 'team.jpg'),
      _getSingleServiceItem('cyber_services/coding-svgrepo-com.svg',
          'SECURISATION CODE LOGICIEL', 'coding.jpg'),
    ];

    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _getServicesTitle('Services de développement'),
          const SizedBox(
            height: spaceBetweenBigTitleAndTextBody,
          ),
          CustomCarousel(
            widgets: devServices,
          ),
          const SizedBox(
            height: 30,
          ),
          _getServicesTitle('Services de cybersécurité'),
          const SizedBox(
            height: spaceBetweenBigTitleAndTextBody,
          ),
          CustomCarousel(
            widgets: cybersecurity,
          ),
        ],
      ),
    );
  }

  Row _getServicesTitle(String title) {
    return Row(
      children: [
        const SizedBox(
          width: spaceLeftBigTitle,
        ),
        CustomUnderlineTitle(title: title)
      ],
    );
  }

  _getSingleServiceItem(String svgLink, String title, String imagePath) {
    double heightBloc = 316;
    double widthBloc = 616;
    return Padding(
        padding: const EdgeInsets.only(left: 70, bottom: 20),
        child: Container(
          height: heightBloc,
          width: widthBloc,
          child: Stack(
            children: [
              Image.asset(
                'assets/services_images/$imagePath',
                width: widthBloc,
                height: heightBloc,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomIconButton(
                      iconPath: 'assets/services_icons/$svgLink',
                      size: 100,
                      primaryColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
