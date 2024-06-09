import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import "package:google_fonts/google_fonts.dart";
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
import 'package:ohana_webapp_flutter/presentation/pages/expertisesPages/widgets/services_banner.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/infos_pannel.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_text_list.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_carousel.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/bold_text_customiser.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_text_block.dart';

class WebServicePageLargeScreen extends StatelessWidget {
  const WebServicePageLargeScreen({super.key});

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
          title: 'DEVELOPPEMENT WEB',
          imagePath:
              'assets/services_images/dev_services/web/programming-background-with-person-working-with-codes-computer.jpg',
          text:
              'Notre équipe de développeurs web qualifiés conçoit et développe des sites web sur mesure pour répondre aux besoins spécifiques de nos clients. Nous accordons une attention particulière à la convivialité et à la performance',
        ),
        const SizedBox(height: 50),
        _getDevServicesList(),
        const SizedBox(
          height: 10,
        ),
        _getTextCustomCard(),
        const SizedBox(
          height: 10,
        ),
        _getProcessShowcases(),
        const SizedBox(
          height: 70,
        ),
        _getCustomImage(
            title: 'Nous restons à votre service',
            imagePath:
                'assets/services_images/services_acceuil_official_free_image.webp'),
        const SizedBox(
          height: 10,
        ),
        const FooterLargeScreen()
      ],
    );
  }

//TEXT BODY
  _getTextCustomCard({bool reverseMode = false}) {
    TextDirection rtlDirection = TextDirection.rtl;
    double textWidth = 800;
    double fontsize = 20;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextBlock(
          image:
              'assets/services_images/dev_services/web/representations-ui-ux-ordinateur-portable_23-2150201871.jpg',
          widget: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Conception de Sites Web Personnalisés ',
                style: TextStyle(
                    fontSize: textBigTitleFontSize,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              BoldTextCustomizer(
                  width: textWidth,
                  text:
                      ' Nous créons des sites web sur mesure qui reflètent parfaitement l\'identité de votre marque. Nos designs sont modernes, intuitifs et adaptés à vos besoins spécifiques.',
                  boldTextList: const ['Conception de Sites Web']),
            ],
          ),
        ),
        CustomTextBlock(
          image:
              'assets/services_images/dev_services/web/homepage-seen-computer-screen.jpg',
          textDirection: rtlDirection,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Développement site responsive',
                style: TextStyle(
                    fontSize: textBigTitleFontSize,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              BoldTextCustomizer(
                  width: textWidth,
                  text:
                      'E-commerce \n Nous développons des boutiques en ligne sécurisées et performantes, intégrées avec les solutions de paiement les plus populaires et des fonctionnalités avancées pour gérer vos ventes et inventaires.',
                  boldTextList: const ['E-commerce']),
              CustomListText(fontSize: 20, width: textWidth, textList: const [
                'CMS (Systèmes de Gestion de Contenu): Nous mettons en place des CMS comme WordPress, Joomla ou Drupal pour vous permettre de gérer facilement votre contenu et de mettre à jour votre site sans connaissances techniques avancées.',
                'Optimisation SEO: Nos sites sont conçus pour être facilement trouvés sur les moteurs de recherche grâce à des techniques avancées de référencement naturel (SEO).'
              ])
            ],
          ),
        ),
        CustomTextBlock(
          image:
              'assets/services_images/dev_services/web/miniature-workmen-repairing-laptop-keyboard.jpg',
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Maintenance et Support',
                style: TextStyle(
                    fontSize: textBigTitleFontSize,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              BoldTextCustomizer(
                  width: textWidth,
                  text:
                      'Nous offrons des services de maintenance continue pour garantir que votre site reste à jour, sécurisé et performant. Notre équipe de support est disponible pour répondre à toutes vos questions et besoins.',
                  boldTextList: const ['E-commerce']),
            ],
          ),
        ),
      ],
    );
  }

  _getProcessShowcases() {
    //TO DO IMPLEMENTS
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Notre Processus',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: InfosPannel(
                svgLink:
                    'assets/services_icons/dev_services/business-consultant-consulting-svgrepo-com.svg',
                title: 'Consultation Initiale',
                text:
                    ' Nous commençons par comprendre vos besoins, objectifs et attentes pour votre site web.',
              ),
            ),
            SizedBox(
              height: 400,
              child: VerticalDivider(
                color: Colors.purple,
                thickness: 2,
                width: 20,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: InfosPannel(
                svgLink: 'assets/services_icons/dev_services/design.svg',
                title: 'Design et Maquette ',
                text:
                    'Nous créons des maquettes et prototypes interactifs pour valider le design avec vous avant le développement.',
              ),
            ),
            SizedBox(
              height: 400,
              child: VerticalDivider(
                color: Colors.purple,
                thickness: 2,
                width: 20,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: InfosPannel(
                svgLink: 'assets/services_icons/dev_services/devLogo.svg',
                title: 'Développement ',
                text:
                    'Nos développeurs construisent votre site en utilisant les dernières technologies et meilleures pratiques de l\'industrie.',
              ),
            ),
            SizedBox(
              height: 400,
              child: VerticalDivider(
                color: Colors.purple,
                thickness: 2,
                width: 20,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: InfosPannel(
                svgLink: 'assets/services_icons/dev_services/testValidate.svg',
                title: 'Tests et Lancements  ',
                text:
                    'Nous effectuons des tests rigoureux pour assurer la qualité et la performance avant de lancer votre site en ligne.',
              ),
            ),
            SizedBox(
              height: 400,
              child: VerticalDivider(
                color: Colors.purple,
                thickness: 2,
                width: 20,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: InfosPannel(
                svgLink:
                    'assets/services_icons/dev_services/support-svgrepo-com.svg',
                title: 'Formation et Support ',
                text:
                    'Après le lancement, nous vous formons à l\'utilisation de votre site et restons disponibles pour tout support nécessaire.',
              ),
            ),
          ],
        ),
      ],
    );
  }

  _getCustomImage({required String imagePath, required String title}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          title,
          style: GoogleFonts.majorMonoDisplay(fontSize: 30),
          //   TextStyle(
          //   fontSize: 35,
          //   fontWeight: FontWeight.bold,
          //
          // ),
        ),
        Image.asset(
          imagePath,
          height: 400,
        ),
      ],
    );
  }

//CATALOG LIST
  _getDevServicesList() {
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

    return CustomCarousel(
        title: 'Nos Services De Développement', widgets: devServices);
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
