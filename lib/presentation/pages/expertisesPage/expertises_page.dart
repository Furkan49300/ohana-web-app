import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_screen_fit.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navbar_responsiveness.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/pages/responsive.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_carousel.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/strong_points_section.dart';

class ExpertisesPage extends StatelessWidget {
  const ExpertisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = Responsive.getScreenSizeWidth(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavbarResponsiveness.getNavbar(screenSizeWidth),
      endDrawer: NavbarResponsiveness.getEndDrawer(screenSizeWidth),
      body: Expanded(
        child: SizedBox(
            width: screenSizeWidth,
            child: Stack(
              children: [
                // CONTENT
                GestureDetector(
                  onTap: () {
                    context.read<DropdownMenuBloc>().add(HideMenuEvent());
                  },
                  child: SingleChildScrollView(
                    child: _content(screenSizeWidth, context),
                  ),
                ),
                // NAVBAR MEGA-DROPDOWN MENUS
                const DropdownMenuExpertises(),
                const DropdownMenuOffers(),
                const DropdownMenuAboutUs(),

                //SEARCH BAR
                SearchNavBar(
                  placeholder:
                      "Cherchez une page, un service, un article, une offre d'emploi...",
                )
              ],
            )),
      ),
    );
  }

  _content(double screenSizeWidth, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/services_images/services_acceuil_official_free_image.webp',
          width: screenSizeWidth,
          height: 500,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 50),
        const CustomUnderlineTitle(title: 'Nos Services'),
        const SizedBox(height: 40),
        const SizedBox(
          width: 900,
          child: Text(
            'Nous proposons differents types de services de développement et de cybersécurité, Nous n\'hésitons pas à mettre notre coeur à l\'ouvrage car le développement est avant tout une activité qui nous passionne et nous voulons faire profiter de cette passion à tout nos clients et potentiel client',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19),
          ),
        ),
        const SizedBox(height: 60),
        const ServicesCards(),
        const SizedBox(height: 70),
        const StrongPointsSection(),
        const SizedBox(height: 70),
        const Footer()
      ],
    );
  }
}

//-----SERVICES BLOC

class ServicesCards extends StatelessWidget {
  const ServicesCards({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> devServices = [
      _getSingleServiceItem(
          svgLink: 'assets/services_icons/dev_services/devLogo.svg',
          title: 'DÉVELOPPEMENT WEB',
          imagePath: 'assets/services_images/dev_services/devWeb.jpg',
          context: context,
          routeName: web),
      _getSingleServiceItem(
        svgLink:
            'assets/services_icons/dev_services/software-developer-work-on-computer-programmer-coder-svgrepo-com.svg',
        title: 'LOGICIELS',
        imagePath: 'assets/services_images/dev_services/logiciel.jpg',
        context: context,
      ),
      _getSingleServiceItem(
          svgLink: 'assets/services_icons/dev_services/design.svg',
          title: 'DESIGN',
          imagePath: 'assets/services_images/dev_services/webdesing.jpg',
          context: context),
      _getSingleServiceItem(
          svgLink: 'assets/services_icons/dev_services/locked.svg',
          title: 'CYBERSECURITÉ',
          imagePath: 'assets/services_images/dev_services/cyber.jpg',
          context: context),
      _getSingleServiceItem(
          svgLink: 'assets/services_icons/dev_services/ref.svg',
          title: 'RÉFÉRENCEMENT',
          imagePath: 'assets/services_images/dev_services/ref.jpg',
          context: context),
      _getSingleServiceItem(
          svgLink: 'assets/services_icons/dev_services/testValidate.svg',
          title: 'TESTING',
          imagePath: 'assets/services_images/dev_services/webTesting.jpg',
          context: context),
      _getSingleServiceItem(
          svgLink: 'assets/services_icons/dev_services/increase.svg',
          title: 'IA GENERATIVE',
          imagePath: 'assets/services_images/dev_services/ia.jpg',
          context: context),
    ];
    List<Widget> cybersecurity = [
      _getSingleServiceItem(
          svgLink:
              'assets/services_icons/cyber_services/audit-report-svgrepo-com.svg',
          title: 'AUDIT DE SECURITE',
          imagePath: 'assets/services_images/cyber_services/audit.jpg',
          context: context),
      _getSingleServiceItem(
          svgLink: 'assets/services_icons/cyber_services/trace-svgrepo-com.svg',
          title: 'AUDIT DE VULNERABILITE',
          imagePath: 'assets/services_images/cyber_services/vulnerability.jpg',
          context: context),
      _getSingleServiceItem(
          svgLink: 'assets/services_icons/cyber_services/rules-svgrepo-com.svg',
          title: 'AUDIT DE CONFORMITE',
          imagePath: 'assets/services_images/cyber_services/compliance.jpg',
          context: context),
      _getSingleServiceItem(
          svgLink:
              'assets/services_icons/cyber_services/testing-web-design-svgrepo-com.svg',
          title: 'PENTESTING',
          imagePath: 'assets/services_images/cyber_services/pentesting.jpg',
          context: context),
      _getSingleServiceItem(
          svgLink:
              'assets/services_icons/cyber_services/team-work-svgrepo-com.svg',
          title: 'ACCOMPAGNEMENT EQUIPE',
          imagePath: 'assets/services_images/cyber_services/team.jpg',
          context: context),
      _getSingleServiceItem(
          svgLink:
              'assets/services_icons/cyber_services/coding-svgrepo-com.svg',
          title: 'SECURISATION CODE LOGICIEL',
          imagePath: 'assets/services_images/cyber_services/coding.jpg',
          context: context),
    ];

    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          const SizedBox(height: spaceBetweenBigTitleAndTextBody),
          const CustomUnderlineTitle(title: 'Services de développement'),
          const SizedBox(height: 35),
          CustomCarousel(
            widgets: devServices,
            viewportFraction: 0.3,
            carouselHeight: 320,
          ),
          const SizedBox(height: 50),
          const CustomUnderlineTitle(title: 'Services de cybersécurité'),
          const SizedBox(height: 35),
          CustomCarousel(
            widgets: cybersecurity,
            viewportFraction: 0.3,
            carouselHeight: 320,
          ),
        ],
      ),
    );
  }

  _getSingleServiceItem(
      {required String svgLink,
      required String title,
      required String imagePath,
      required context,
      String routeName = ''}) {
    double heightBloc = 316;
    double widthBloc = 616;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.grab,
        child: SizedBox(
          height: heightBloc,
          width: widthBloc,
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                width: widthBloc,
                height: heightBloc,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      svgLink,
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
