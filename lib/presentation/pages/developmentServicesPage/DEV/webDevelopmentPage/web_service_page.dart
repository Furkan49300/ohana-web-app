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

class WebServicePage extends StatelessWidget {
  WebServicePage({super.key});

  final Map<String, GlobalKey> keysMap = {
    "Conception et UX/UI Design": GlobalKey(),
    'front_end': GlobalKey(),
    "developpement_Back-End": GlobalKey(),
    "e_commerce": GlobalKey(),
    'SEO_et_Performance_Web': GlobalKey(),
    'Sécurité_et_Maintenance': GlobalKey(),
    'Support_et_Formation': GlobalKey(),
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
        const SizedBox(height: 10),
        _getConcludingText(),
        const SizedBox(height: 10),
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
        'assets/services_images/dev_services/web/programming-background-with-person-working-with-codes-computer.jpg',
        width: screenSizeWidth,
        height: 500,
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 70),
      const Text(
        'DEVELOPPEMENT WEB',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 40),
      const SizedBox(
        width: 900,
        child: Text(
          'Notre équipe de développeurs web qualifiés conçoit et développe des sites web sur mesure pour répondre aux besoins spécifiques de nos clients. Nous accordons une attention particulière à la convivialité et à la performance',
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

//Conception et UX/UI Design

        CustomTextBlock(
          key: keysMap["Conception_et_UX/UI_Design"],
          image:
              'assets/services_images/dev_services/web/Tiny_graphic_designer_drawing_with_big_pen_on_computer screen.jpg',
          title: 'Conception et UX/UI Design',
          text:
              "L'expérience utilisateur (UX) et l'interface utilisateur (UI) sont au cœur de nos processus de développement. Nous concevons des interfaces intuitives et visuellement attrayantes qui offrent une navigation fluide et améliorent l'engagement des utilisateurs. Nos designers travaillent en étroite collaboration avec vous pour comprendre votre vision et vos besoins, créant ainsi des maquettes et des prototypes interactifs avant de passer au développement.",
        ),
        const SizedBox(height: 50),

// Développement Front-End

        CustomTextBlock(
          key: keysMap["front_end"],
          title: 'Développement Front-End',
          image: 'assets/services_images/dev_services/web/front-end.jpg',
          textDirection: rtlDirection,
          text:
              "Notre équipe de développeurs front-end est experte dans les technologies les plus récentes telles que HTML5, CSS3, JavaScript et frameworks modernes comme React, Angular et Vue.js. Nous nous assurons que chaque site web est optimisé pour les performances, compatible avec tous les navigateurs et entièrement responsive, garantissant une expérience utilisateur cohérente sur tous les appareils.",
        ),
        const SizedBox(height: 50),

// Développement Back-End

        CustomTextBlock(
          key: keysMap["developpement_Back-End"],
          title: 'Développement Back-End',
          text:
              "Pour des applications web robustes et évolutives, notre équipe back-end utilise des technologies de pointe comme Node.js, Django, Ruby on Rails, et PHP. Nous construisons des architectures solides qui assurent la fiabilité, la sécurité et la rapidité des sites web. Nos solutions back-end sont conçues pour gérer efficacement les bases de données, les serveurs et les API, permettant une intégration transparente avec d'autres systèmes et services.",
          image: 'assets/services_images/dev_services/web/back-end.jpg',
          boldList: const [''],
        ),
        const SizedBox(height: 50),

//E-commerce et Solutions de Paiement

        CustomTextBlock(
          key: keysMap["e_commerce"],
          textDirection: rtlDirection,
          title: 'E-commerce et Solutions de Paiement',
          text:
              "Nous développons des plateformes e-commerce sur mesure qui simplifient la gestion des produits, des commandes et des clients. En intégrant des solutions de paiement sécurisées, nous assurons une transaction fluide et sécurisée pour vos clients. Nos solutions incluent également des fonctionnalités de gestion des stocks, des analyses de ventes et des outils marketing pour maximiser vos ventes en ligne.",
          image: 'assets/services_images/dev_services/web/customer.jpg',
          boldList: const [''],
        ),
        const SizedBox(height: 50),

//SEO et Performance Web

        CustomTextBlock(
          key: keysMap["SEO_et_Performance_Web"],
          title: 'SEO et Performance Web',
          text:
              "La visibilité et la performance de votre site web sont cruciales. C’est pourquoi nous intégrons les meilleures pratiques de SEO (Search Engine Optimization) dès le début du développement. Nous optimisons la vitesse de chargement des pages, la structure du site et le contenu pour améliorer le classement dans les moteurs de recherche, attirer plus de visiteurs et augmenter les conversions.",
          image: 'assets/services_images/dev_services/web/seo.jpg',
          boldList: const [''],
        ),
        const SizedBox(height: 50),

//Sécurité et Maintenance

        CustomTextBlock(
          key: keysMap["Sécurité_et_Maintenance"],
          textDirection: rtlDirection,
          title: 'Sécurité et Maintenance',
          text:
              "Chez Ohana Entreprise, la sécurité de vos données est notre priorité. Nous appliquons des mesures de sécurité rigoureuses, incluant des audits réguliers, le cryptage des données et la protection contre les cybermenaces. De plus, nous offrons des services de maintenance continue pour assurer que votre site reste à jour, performant et sécurisé.",
          image:
              'assets/services_images/dev_services/web/Wavy_Bus-41_Single-09.jpg',
          boldList: const [''],
        ),
        const SizedBox(height: 50),

//Support et Formation

        CustomTextBlock(
          key: keysMap["Support_et_Formation"],
          title: 'Support et Formation',
          text:
              "Notre engagement ne s’arrête pas à la mise en ligne de votre site. Nous fournissons un support technique constant et proposons des sessions de formation pour vous aider à gérer et à maintenir votre site web de manière autonome. Notre équipe est toujours disponible pour répondre à vos questions et vous assister dans l’utilisation de votre nouvelle solution web.",
          image:
              'assets/services_images/dev_services/web/employees_with_laptops.jpg',
          boldList: const [''],
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

//CONCLUDING TEXT
  _getConcludingText() {
    return const SizedBox(
        width: 900,
        child: Text(
            "En choisissant Ohana Entreprise pour vos besoins en développement web, vous bénéficiez de l'expertise d'une équipe dédiée et passionnée, prête à transformer vos idées en réalité. Nous nous engageons à fournir des solutions web qui non seulement répondent à vos attentes mais qui surpassent les standards de l'industrie, garantissant ainsi la croissance et le succès de votre entreprise en ligne.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19)));
  }

  _getDevServicesList() {
    List<Widget> devServices = [
      _getCarouselItems(
          title: 'Conception et UX/UI Design',
          imagePath:
              'Tiny_graphic_designer_drawing_with_big_pen_on_computer screen.jpg',
          globalKey: keysMap['Conception_et_UX/UI_Design'],
          duration: 1),
      _getCarouselItems(
          title: 'Front-End',
          imagePath: 'front-end.jpg',
          globalKey: keysMap['front_end'],
          duration: 1),
      _getCarouselItems(
          title: 'Développement Back-End',
          imagePath: 'back-end.jpg',
          globalKey: keysMap["developpement_Back-End"],
          duration: 1),
      _getCarouselItems(
          title: 'E-commerce et Solutions de Paiement',
          imagePath: 'customer.jpg',
          globalKey: keysMap["e_commerce"],
          duration: 1),
      _getCarouselItems(
          title: 'SEO et Performance Web',
          imagePath: 'seo.jpg',
          globalKey: keysMap["SEO_et_Performance_Web"],
          duration: 2),
      _getCarouselItems(
          title: 'Sécurité et Maintenance',
          imagePath: 'Wavy_Bus-41_Single-09.jpg',
          globalKey: keysMap["Sécurité_et_Maintenance"],
          duration: 2),
      _getCarouselItems(
          title: 'Support et Formation',
          imagePath: 'employees_with_laptops.jpg',
          globalKey: keysMap['Support_et_Formation'],
          duration: 2),
    ];

    return CustomCarousel(
        carouselHeight: 312,
        title: 'Nos Services De Développement',
        widgets: devServices);
  }

  _getCarouselItems(
      {required String title,
      required String imagePath,
      Color textColor = Colors.black,
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
              'assets/services_images/dev_services/web/$imagePath',
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
                    style: TextStyle(
                        color: textColor,
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
