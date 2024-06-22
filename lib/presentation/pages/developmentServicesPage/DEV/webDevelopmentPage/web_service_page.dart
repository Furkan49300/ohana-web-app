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
    "Conception_de_Sites_Web_Personnalisés": GlobalKey(),
    "Développement_site_responsive": GlobalKey(),
    "Maintenance_et_Support": GlobalKey(),
    "landing_page": GlobalKey(),
    'e_commerce': GlobalKey(),
    'marketing_digital_pub': GlobalKey(),
    'hub': GlobalKey(),
    'showcase_site': GlobalKey(),
    'ref': GlobalKey()
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

//CONCEPTION SITE SUR MESURE

        CustomTextBlock(
          key: keysMap["Conception_de_Sites_Web_Personnalisés"],
          image:
              'assets/services_images/dev_services/web/representations-ui-ux-ordinateur-portable_23-2150201871.jpg',
          title: 'Conception de Sites Web Personnalisés',
          text:
              "Un site web sur mesure est construit spécifiquement pour répondre aux besoins uniques d'une entreprise ou d'une organisation. Contrairement aux plateformes CMS (Content Management System) comme WordPress, un site sur mesure est développé à partir de zéro en utilisant des technologies et des fonctionnalités spécifiques, offrant ainsi une flexibilité et une personnalisation maximales pour répondre aux exigences particulières du client.",
        ),
        const SizedBox(height: 50),

// E-COMMERCE SERVICE

        CustomTextBlock(
          key: keysMap["e_commerce"],
          title: 'Développement site E-commerce',
          image:
              'assets/services_images/dev_services/web/homepage-seen-computer-screen.jpg',
          textDirection: rtlDirection,
          text:
              "Le développement d'un site e-commerce implique la création d'une plateforme en ligne permettant aux entreprises de vendre leurs produits ou services directement aux consommateurs via Internet. Un site e-commerce doit inclure des fonctionnalités telles que la gestion de catalogues de produits, des paniers d'achat, des passerelles de paiement sécurisées, la gestion des commandes, etc.",
          textBulletList: const [
            'CMS (Systèmes de Gestion de Contenu): Nous mettons en place des CMS comme WordPress, Joomla ou Drupal pour vous permettre de gérer facilement votre contenu et de mettre à jour votre site sans connaissances techniques avancées.',
            'Optimisation SEO: Nos sites sont conçus pour être facilement trouvés sur les moteurs de recherche grâce à des techniques avancées de référencement naturel (SEO).'
          ],
        ),
        const SizedBox(height: 50),

// MAINTENANCE

        CustomTextBlock(
          key: keysMap["Maintenance_et_Support"],
          title: 'Maintenance et Support',
          text:
              'Nous offrons des services de maintenance continue pour garantir que votre site reste à jour, sécurisé et performant. Notre équipe de support est disponible pour répondre à toutes vos questions et besoins.',
          image:
              'assets/services_images/dev_services/web/miniature-workmen-repairing-laptop-keyboard.jpg',
          boldList: const [''],
        ),
        const SizedBox(height: 50),

//LANDING PAGE

        CustomTextBlock(
          key: keysMap["landing_page"],
          textDirection: rtlDirection,
          title: 'Landing Page',
          text:
              "Une landing page (ou page d'atterrissage) est une page web conçue spécifiquement pour convertir les visiteurs en leads ou en clients potentiels. Elle est généralement utilisée dans le cadre de campagnes marketing ou publicitaires et se concentre sur un objectif spécifique, comme l'inscription à une newsletter, le téléchargement d'un ebook ou l'achat d'un produit.",
          image:
              'assets/services_images/dev_services/web/landing-page-exemple-1.png',
          boldList: const [''],
        ),
        const SizedBox(height: 50),

//MARKETING/PUBLICITE DIGITAL

        CustomTextBlock(
          key: keysMap["marketing_digital_pub"],
          title: 'Marketing et publicités digitales',
          text:
              "Le marketing et la publicité digitale font référence aux stratégies et aux tactiques utilisées pour promouvoir un produit, un service ou une marque sur Internet. Cela peut inclure des campagnes de publicité payante sur les réseaux sociaux, les moteurs de recherche (comme Google Ads), le marketing par e-mail, le marketing de contenu, le SEO (optimisation pour les moteurs de recherche) et d'autres formes de marketing en ligne pour attirer et convertir les clients potentiels.",
          image:
              'assets/services_images/dev_services/web/Qui-sont-principaux-acteurs-publicite-digitale--F.jpg',
          boldList: const [''],
        ),
        const SizedBox(height: 50),

//HEBERGEMENT

        CustomTextBlock(
          key: keysMap["hub"],
          textDirection: rtlDirection,
          title: 'Hébergement',
          text:
              "L'hébergement web est le service qui permet à un site web d'être accessible sur Internet. Cela implique de stocker les fichiers du site sur un serveur web, assurant ainsi que le site est disponible 24/7 pour les visiteurs. Les services d'hébergement peuvent varier en termes de performances, de sécurité, de support technique et de capacités spécifiques (comme le support pour des bases de données spécifiques ou des langages de programmation).",
          image: 'assets/services_images/dev_services/web/hebergement-web.jpg',
          boldList: const [''],
        ),
        const SizedBox(height: 50),

//SITE VITRINE

        CustomTextBlock(
          key: keysMap["showcase_site"],
          title: 'Site vitrine',
          text:
              "Un site vitrine est une plateforme web conçue principalement pour présenter une entreprise, ses produits, ses services et ses valeurs. Il sert souvent de première impression pour les visiteurs et vise à informer, attirer et convertir les visiteurs en clients potentiels. Généralement, un site vitrine est statique et ne comporte pas de fonctionnalités avancées de commerce en ligne.",
          image:
              'assets/services_images/dev_services/web/carte-visite-logo-site-vitrine-04-16-258.jpg',
          boldList: const [''],
        ),
        const SizedBox(height: 50),

//REFERENC...

        CustomTextBlock(
          key: keysMap["ref"],
          textDirection: rtlDirection,
          title: 'Référencement\n (SEO - Search Engine Optimization)',
          text:
              "Le référencement est l'ensemble des techniques et stratégies visant à améliorer la visibilité d'un site web dans les résultats des moteurs de recherche (comme Google, Bing, Yahoo, etc.). L'objectif principal du SEO est d'augmenter le trafic organique (non payant) vers un site web en favorisant son classement dans les résultats de recherche pour des mots-clés pertinents.",
          image:
              'assets/services_images/dev_services/web/referencement-web.jpg',
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

//CATALOG LIST
  _getDevServicesList() {
    List<Widget> devServices = [
      _getCatalogItem(
          title: 'SITE VITRINE',
          imagePath: 'webshowcases.jpg',
          globalKey: keysMap['showcase_site'],
          duration: 2),
      _getCatalogItem(
          title: 'SITE E-COMMERCE',
          imagePath: 'e-commerce.jpg',
          globalKey: keysMap['e_commerce'],
          duration: 1),
      _getCatalogItem(
          title: 'LANDING PAGE',
          imagePath: 'landingPage.jpg',
          globalKey: keysMap["landing_page"],
          duration: 1),
      _getCatalogItem(
          title: 'SITE SUR MESURE',
          imagePath: 'measurement.jpg',
          globalKey: keysMap["Conception_de_Sites_Web_Personnalisés"],
          duration: 2),
      _getCatalogItem(
          title: 'HEBERGEMENT',
          imagePath: 'accomodation.jpg',
          globalKey: keysMap["hub"],
          duration: 2),
      _getCatalogItem(
          title: 'MAINTENANCE',
          imagePath: 'maintain.jpg',
          globalKey: keysMap["Maintenance_et_Support"],
          duration: 1),
      _getCatalogItem(
          title: 'RÉFÉRENCEMENT',
          imagePath: 'ref.jpg',
          globalKey: keysMap['ref'],
          duration: 2),
      _getCatalogItem(
          title: 'MAKETING/PUBLICITES DIGITALES',
          imagePath: 'webpub.jpg',
          globalKey: keysMap["marketing_digital_pub"],
          duration: 2),
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
