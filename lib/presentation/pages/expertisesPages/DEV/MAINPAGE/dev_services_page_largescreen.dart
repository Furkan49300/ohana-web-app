import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/pages/offersPages/MAINPAGE/widgets/circular_image_loader.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_text_list.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_large_screen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navigation_bar_contents_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';

class DevServicesPageLargeScreen extends StatelessWidget {
  const DevServicesPageLargeScreen({super.key});

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
            ),
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
              _getBanner(),
              const SizedBox(height: 70),
              const Text(
                'Transformez Vos Idées en Réalité Numérique',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              const SizedBox(
                width: 900,
                child: Text(
                  "Chez OHana Entreprise, nous vous accompagnons dans la création de solutions numériques sur mesure pour répondre à vos besoins spécifiques. De la conception de sites web élégants et performants à la réalisation d'applications mobiles innovantes, nous sommes votre partenaire de confiance pour un développement de qualité.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19),
                ),
              ),
              const SizedBox(height: 100),
              _getWebServicesSections(),
              const SizedBox(height: 20),
              const SizedBox(
                width: 900,
                child: Text(
                  "Besoin d'aide ou de plus d'informations ? Contactez-nous dès aujourd'hui et découvrez comment nous pouvons transformer vos idées en réalité numérique !",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19),
                ),
              ),
              const SizedBox(height: 10),
              Button('Contactez-Nous',
                  type: ButtonType.standard,
                  onTap: () => Navigator.of(context).pushNamed(contactUs)),
              const SizedBox(height: 90),
              const FooterLargeScreen(),
            ],
          ),
        ),
      ),
    );
  }

  _getBanner() {
    return const CustomBanner(
      imagePath:
          'assets/services_images/dev_services/person-working-html-computer.jpg',
      widget: Column(
        children: [
          Text(
            'Découvrez nos Solutions Innovantes en Développement',
            style: TextStyle(fontSize: 70, color: Colors.purple),
          ),
          SizedBox(height: 10),
          Text(
              'Élevez Votre Entreprise au Prochain Niveau avec nos Services de Développement Web et Mobile',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple)),
        ],
      ),
    );
  }

  _getWebServicesSections() {
    List<Map<String, dynamic>> devServices = [
      {
        'title': "E-commerce et Solutions de Vente en Ligne",
        'imagePath':
            "assets/services_images/dev_services/advanced-features-of-ecommerce-app.webp",
        'description':
            "Nous créons des boutiques en ligne robustes, sécurisées et conviviales pour stimuler les ventes et la croissance de votre entreprise. Nos solutions e-commerce sont conçues pour offrir une expérience d'achat fluide et agréable.",
        "strongPoint": [
          {
            'point': " Ajout et gestion facile des produits.",
            'svgLink':
                'assets/services_icons/dev_services/products-svgrepo-com.svg'
          },
          {
            'point':
                " Intégration de diverses méthodes de paiement sécurisées.",
            'svgLink':
                'assets/services_icons/dev_services/payment-euro-svgrepo-com.svg'
          },
          {
            'point': " Expérience d'achat fluide sur les appareils mobiles.",
            'svgLink':
                'assets/services_icons/dev_services/shopping-card-svgrepo-com.svg'
          },
          {
            'point':
                " Outils de promotion, de réduction et de fidélisation des clients",
            'svgLink':
                'assets/services_icons/dev_services/tools-svgrepo-com.svg'
          },
        ]
      },
      {
        'title': "Développement de Portails Web",
        'imagePath':
            "assets/services_images/dev_services/custom-web-application-development-in-kenya-galactik-it-solutions1.webp",
        'description':
            "Nous développons des portails web interactifs et dynamiques pour divers secteurs d'activité. Nos portails web sont conçus pour gérer un grand nombre d'utilisateurs et pour offrir des fonctionnalités avancées.",
        "strongPoint": [
          {
            'point': " Systèmes de gestion de contenu (CMS) puissants.",
            'svgLink':
                'assets/services_icons/dev_services/interface-control-svgrepo-com.svg'
          },
          {
            'point':
                "Protocoles de sécurité robustes pour protéger les données sensibles.",
            'svgLink': 'assets/services_icons/dev_services/dns-svgrepo-com.svg'
          },
          {
            'point':
                " Connexion avec d'autres systèmes et services via des API.",
            'svgLink':
                'assets/services_icons/dev_services/api-interface-svgrepo-com.svg'
          },
          {
            'point':
                " Outils de promotion, de réduction et de fidélisation des clients",
            'svgLink':
                'assets/services_icons/dev_services/tools-svgrepo-com.svg'
          },
        ]
      },
      {
        'title': " Applications SaaS (Software as a Service)",
        'imagePath':
            "assets/services_images/dev_services/5218d3fd-9ee6-47f7-9621-b4b7a0d24c2d.webp",
        "strongPoint": [
          {
            'point': "Capacité à gérer une croissance rapide de l'utilisateur.",
            'svgLink':
                'assets/services_icons/dev_services/load-factor-svgrepo-com.svg'
          },
          {
            'point': "Mises à jour et maintenance centralisées.",
            'svgLink':
                'assets/services_icons/dev_services/update-svgrepo-com.svg'
          },
          {
            'point':
                " Accessible via les navigateurs web sur tous les appareils.",
            'svgLink':
                'assets/services_icons/dev_services/navigation-2-svgrepo-com.svg'
          },
          {
            'point': "Protection avancée des données clients et entreprise",
            'svgLink':
                'assets/services_icons/dev_services/hikiryomon-three-lines-in-a-circle-family-crest-svgrepo-com.svg'
          },
        ]
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: devServices
          .map((item) => SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircularImageLoader(
                        imagePath: item['imagePath'],
                        width: 820,
                        height: 550,
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            for (var strongPoint in item['strongPoint'])
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          color: purpleNeutral,
                                          borderRadius: BorderRadius.circular(
                                            completeCirvularItem,
                                          )),
                                      child: SvgPicture.asset(
                                        strongPoint['svgLink'],
                                        width: 30,
                                        height: 30,
                                        colorFilter: const ColorFilter.mode(
                                            Colors.white, BlendMode.srcIn),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      strongPoint['point'],
                                      style: const TextStyle(fontSize: 19),
                                    )
                                  ],
                                ),
                              )
                          ]))
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
