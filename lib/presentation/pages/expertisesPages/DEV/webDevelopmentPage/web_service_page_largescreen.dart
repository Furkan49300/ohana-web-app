import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_screen_fit.dart';
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
  WebServicePageLargeScreen({super.key});

  final Map<String, GlobalKey> keysMap = {
    "Conception_de_Sites_Web_Personnalisés": GlobalKey(),
    "Développement_site_responsive": GlobalKey(),
    "Maintenance_et_Support": GlobalKey(),
  };

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
                SearchNavBar(
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
        ServicesBanner(
          screenSizeWidth: screenSize.width,
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
        _getTextCustomCard(screenSize: screenSize),
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
        const Footer()
      ],
    );
  }

//TEXT BODY
  _getTextCustomCard({bool reverseMode = false, required Size screenSize}) {
    TextDirection rtlDirection = TextDirection.rtl;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        CustomTextBlock(
          key: keysMap["Conception_de_Sites_Web_Personnalisés"],
          image:
              'assets/services_images/dev_services/web/representations-ui-ux-ordinateur-portable_23-2150201871.jpg',
          title: 'Conception de Sites Web Personnalisés',
          text:
              ' Nous créons des sites web sur mesure qui reflètent parfaitement l\'identité de votre marque. Nos designs sont modernes, intuitifs et adaptés à vos besoins spécifiques.',
        ),
        const SizedBox(height: 30),
        CustomTextBlock(
          key: keysMap["Développement_site_responsive"],
          title: 'Développement site responsive',
          image:
              'assets/services_images/dev_services/web/homepage-seen-computer-screen.jpg',
          textDirection: rtlDirection,
          text:
              'E-commerce \n Nous développons des boutiques en ligne sécurisées et performantes, intégrées avec les solutions de paiement les plus populaires et des fonctionnalités avancées pour gérer vos ventes et inventaires.',
          textBulletList: const [
            'CMS (Systèmes de Gestion de Contenu): Nous mettons en place des CMS comme WordPress, Joomla ou Drupal pour vous permettre de gérer facilement votre contenu et de mettre à jour votre site sans connaissances techniques avancées.',
            'Optimisation SEO: Nos sites sont conçus pour être facilement trouvés sur les moteurs de recherche grâce à des techniques avancées de référencement naturel (SEO).'
          ],
        ),
        const SizedBox(height: 40),
        CustomTextBlock(
          key: keysMap["Maintenance_et_Support"],
          title: 'Maintenance et Support',
          text:
              'Nous offrons des services de maintenance continue pour garantir que votre site reste à jour, sécurisé et performant. Notre équipe de support est disponible pour répondre à toutes vos questions et besoins.',
          image:
              'assets/services_images/dev_services/web/miniature-workmen-repairing-laptop-keyboard.jpg',
          boldList: const ['E-commerce'],
        ),
      ],
    );
  }

  _getProcessShowcases() {
    //TO DO IMPLEMENTS
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Notre Processus',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: InfosPannel(
                svgLink:
                    'assets/services_icons/dev_services/business-consultant-consulting-svgrepo-com.svg',
                title: 'Consultation Initiale',
                text:
                    ' Nous commençons par comprendre vos besoins, objectifs et attentes pour votre site web.',
              ),
            ),
            _getVerticalDiverder(),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: InfosPannel(
                svgLink: 'assets/services_icons/dev_services/design.svg',
                title: 'Design et Maquette ',
                text:
                    'Nous créons des maquettes et prototypes interactifs pour valider le design avec vous avant le développement.',
              ),
            ),
            _getVerticalDiverder(),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: InfosPannel(
                svgLink: 'assets/services_icons/dev_services/devLogo.svg',
                title: 'Développement ',
                text:
                    'Nos développeurs construisent votre site en utilisant les dernières technologies et meilleures pratiques de l\'industrie.',
              ),
            ),
            _getVerticalDiverder(),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: InfosPannel(
                svgLink: 'assets/services_icons/dev_services/testValidate.svg',
                title: 'Tests et Lancements  ',
                text:
                    'Nous effectuons des tests rigoureux pour assurer la qualité et la performance avant de lancer votre site en ligne.',
              ),
            ),
            _getVerticalDiverder(),
            const Padding(
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

  SizedBox _getVerticalDiverder() {
    return const SizedBox(
      height: 400,
      child: VerticalDivider(
        color: Colors.purple,
        thickness: 2,
        width: 20,
        indent: 10,
        endIndent: 10,
      ),
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
      _getCatalogItem(
          title: 'SITE VITRINE',
          imagePath: 'webshowcases.jpg',
          globalKey: GlobalKey()),
      _getCatalogItem(
          title: 'SITE E-COMMERCE',
          imagePath: 'e-commerce.jpg',
          globalKey: GlobalKey()),
      _getCatalogItem(
          title: 'LANDING PAGE',
          imagePath: 'landingPage.jpg',
          globalKey: keysMap["Conception_de_Sites_Web_Personnalisés"]),
      _getCatalogItem(
          title: 'SITE SUR MESURE',
          imagePath: 'measurement.jpg',
          globalKey: keysMap["Développement_site_responsive"]),
      _getCatalogItem(
          title: 'HEBERGEMENT',
          imagePath: 'accomodation.jpg',
          globalKey: GlobalKey()),
      _getCatalogItem(
          title: 'MAINTENANCE',
          imagePath: 'maintain.jpg',
          globalKey: keysMap["Maintenance_et_Support"]),
      _getCatalogItem(
          title: 'RÉFÉRENCEMENT', imagePath: 'ref.jpg', globalKey: GlobalKey()),
      _getCatalogItem(
          title: 'MAKETING/PUBLICITES DIGITALES',
          imagePath: 'webpub.jpg',
          globalKey: GlobalKey()),
    ];

    return CustomCarousel(
        title: 'Nos Services De Développement', widgets: devServices);
  }

  _getCatalogItem(
      {required String title, required String imagePath, globalKey}) {
    double width = 700;
    double height = 250;
    return GestureDetector(
      onTap: () {
        Scrollable.ensureVisible(globalKey.currentContext,
            duration: const Duration(seconds: 2), curve: Curves.easeInOut);
      },
      child: Center(
          child: SizedBox(
        width: width,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              'assets/services_images/dev_services/catalog_images/$imagePath',
              fit: BoxFit.cover,
              width: width,
              height: height,
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
      )),
    );
  }

//---------
}
