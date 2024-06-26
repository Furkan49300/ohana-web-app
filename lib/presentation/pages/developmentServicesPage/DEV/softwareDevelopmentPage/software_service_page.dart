import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_screen_fit.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navbar_responsiveness.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/pages/responsive.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/infos_pannel.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_carousel.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_text_block.dart';

class SoftwareServicePage extends StatelessWidget {
  SoftwareServicePage({super.key});

  final Map<String, GlobalKey> keysMap = {
    "Application_marketing": GlobalKey(),
    "Application_E_commerce": GlobalKey(),
  };

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
        ..._getBanner(screenSizeWidth),
        const SizedBox(height: 50),
        _getDevServicesList(),
        const SizedBox(height: 10),
        _getTextCustomCard(),
        const SizedBox(
          height: 10,
        ),
        _getProcessShowcases(),
        const SizedBox(height: 70),
        _getCustomImage(
            title: 'Nous restons à votre service',
            imagePath:
                'assets/services_images/services_acceuil_official_free_image.webp'),
        const SizedBox(height: 10),
        const Footer()
      ],
    );
  }

//BANNER

  List<Widget> _getBanner(screenSizeWidth) {
    return [
      Image.asset(
        'assets/services_images/dev_services/software_services/software_dev_banner.jpg',
        width: screenSizeWidth,
        height: 500,
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 70),
      const Text(
        '',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 40),
      const SizedBox(
        width: 900,
        child: Text(
          "Nous créons des applications mobiles natives pour iOS et Android qui offrent des performances optimales et une expérience utilisateur exceptionnelle. Nos développeurs maîtrisent les dernières technologies et les meilleures pratiques pour garantir des applications robustes, sécurisées et évolutives.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 19),
        ),
      ),
    ];
  }

//TEXT BODY
  _getTextCustomCard() {
    TextDirection rtlDirection = TextDirection.rtl;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50),

//Application Marketing

        CustomTextBlock(
          key: keysMap["Application_marketing"],
          image:
              'assets/services_images/dev_services/software_services/employees-working-together-side-view.jpg',
          title: 'Application Marketing',
          text:
              "Nos applications de marketing direct permettent aux entreprises de communiquer directement avec leurs clients via des notifications push, des messages in-app et des campagnes promotionnelles ciblées. Cette approche personnalisée augmente l'engagement et les taux de conversion.",
        ),
        const SizedBox(height: 50),

// Application E-Commerce

        CustomTextBlock(
          key: keysMap["Application_E_commerce"],
          title: 'Application E-Commerce',
          image:
              'assets/services_images/dev_services/software_services/mobile_dev.jpg',
          textDirection: rtlDirection,
          text:
              "nous transformons votre vision e-commerce en une application mobile exceptionnelle. Nos solutions offrent une expérience utilisateur intuitive avec un design attrayant, facilitant la navigation et les transactions. Nous intégrons des fonctionnalités clés comme la gestion des stocks en temps réel, des options de paiement sécurisées, et des solutions de livraison flexibles. Nos outils de marketing intégrés, tels que les notifications push et les programmes de fidélité, augmentent l'engagement des clients. De plus, nous fournissons des analyses détaillées pour optimiser vos stratégies de vente. Choisissez Ohana Entreprise pour une application e-commerce mobile sécurisée, performante et adaptée à vos besoins spécifiques. Contactez-nous dès aujourd'hui pour booster votre commerce en ligne",
        ),
        const SizedBox(height: 50),

//--------------
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
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.start,
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
          title: 'Application Marketing',
          imagePath: 'employees-working-together-side-view.jpg',
          globalKey: keysMap["Application_marketing"],
          duration: 2),
      _getCatalogItem(
          title: 'Application E-Commerce',
          imagePath: 'mobile_dev.jpg',
          globalKey: keysMap['Application_E_commerce'],
          duration: 1),
    ];

    return CustomCarousel(
        carouselHeight: 312,
        title: 'Nos Services De Développement',
        widgets: devServices);
  }

  _getCatalogItem(
      {required String title,
      required String imagePath,
      globalKey,
      int duration = 0}) {
    double width = 700;
    double height = 250;

    return GestureDetector(
      onTap: () {
        Scrollable.ensureVisible(globalKey.currentContext,
            duration: Duration(seconds: duration), curve: Curves.easeInOut);
      },
      child: Center(
          child: SizedBox(
        width: width,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              'assets/services_images/dev_services/software_services/$imagePath',
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
