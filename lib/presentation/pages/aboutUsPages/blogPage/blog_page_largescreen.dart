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
import 'package:ohana_webapp_flutter/presentation/widgets/composants/blog_card.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_smart_paginator.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/circular_text_overlay.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/blog_card_pattern.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_carousel.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/strong_points_section.dart';

class BlogPageLargeScreen extends StatelessWidget {
  const BlogPageLargeScreen({super.key});

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
              _getBlogBanner(
                  mediaScreenSize: screenSize), //blog carousel title embedded
              const SizedBox(height: 70),
              _getBlogInfosTitleEmbeded(),
              const SizedBox(height: 50),
              _getListNumber(),
              const SizedBox(height: 50),
              const FooterLargeScreen(),
            ],
          ),
        ),
      ),
    );
  }

//CarouselItem

  _getBlogBanner({required Size mediaScreenSize}) {
    double height = mediaScreenSize.height / 1.4;
    double width = mediaScreenSize.width;
    List<Map> recentNews = [
      {
        'title': 'Optimisation SEO pour les Sites Web en 2024',
        'imagePath': 'assets/blog_images/homepage-concept-with-search-bar.jpg',
        'text':
            "Les dernières techniques de SEO pour aider votre site web à se classer plus haut dans les résultats de recherche",
        'boldTextList': [''],
        'date': '15/06/2024'
      },
      {
        'title':
            'Flutter vs React Native : Quelle Technologie Choisir en 2024 ',
        'imagePath':
            'assets/blog_images/representations-user-experience-interface-design.jpg',
        'text':
            "Analyse comparative entre Flutter et React Native, couvrant les performances, la facilité d'utilisation, la communauté et les perspectives d'avenir pour aider les développeurs à faire le bon choix.",
        'boldTextList': [''],
        'date': '10/06/2024'
      },
      {
        'title':
            '15 Astuces Indispensables pour Accélérer le Développement Mobile',
        'imagePath':
            'assets/blog_images/businessman-checking-stock-market-online.jpg',
        'text':
            "Découvrez des astuces pratiques pour optimiser votre flux de travail et développer des applications mobiles plus rapidement et plus efficacement",
        'boldTextList': [''],
        'date': '05/06/2024'
      },
      {
        'title':
            'Les Meilleures Pratiques pour Sécuriser Votre Application Mobile',
        'imagePath': 'assets/blog_images/iphone1200x628-v4-fr.jpg',
        'text':
            "Guide complet sur les mesures de sécurité à prendre lors du développement d'applications mobiles pour protéger les données des utilisateurs",
        'boldTextList': [''],
        'date': '05/06/2024'
      },
    ];
    return Column(
      children: [
        // const CustomUnderlineTitle(title: 'Les Nouveautés'),
        CustomCarousel(
            color: Colors.white,
            viewportFraction: 1,
            carouselHeight: height,
            widgets: recentNews
                .map(
                  (item) => SizedBox(
                      // padding: EdgeInsets.symmetric(),
                      width: mediaScreenSize.width,
                      child: Stack(
                        children: [
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.srcATop,
                            ),
                            child: Image.asset(
                              item['imagePath'],
                              height: height,
                              width: width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(90),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //tite
                                SizedBox(
                                  width: 700, //control text width
                                  child: Text(
                                    item['title'],
                                    style: const TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                //date of article
                                Text(
                                  item['date'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(height: 20),
                                // 'See more' Buton

                                SizedBox(
                                  width: 600,
                                  height: 80,
                                  child: Text(
                                    item['text'],
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                // 'See more' Buton
                                const SizedBox(height: 10),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors
                                        .white, // Couleur du texte du bouton
                                    backgroundColor: const Color.fromARGB(
                                        255,
                                        221,
                                        89,
                                        245), // Couleur de fond du bouton
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Voir Plus',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                )
                .toList())
      ],
    );
  }

// GET NEWS
  _getBlogInfosTitleEmbeded() {
    return Column(
      children: [
        const CustomUnderlineTitle(
          title: 'Le Blog OHana Entreprise ',
        ),
        const SizedBox(height: 40),
        _getBlogCards()
      ],
    );
  }

  Widget _getBlogCards() {
    List<Map> news = [
      {
        'title':
            'Développez Votre Première Application Mobile en Flutter : Un Guide Pas à Pas',
        'imagePath': 'assets/blog_images/flutterCover.webp',
        'text':
            "Ce tutoriel vous guidera à travers le processus de développement d'une application mobile de base avec Flutter, y compris la configuration de l'environnement, la création d'une interface utilisateur et le déploiement de l'application. ",
        'boldTextList': [''],
        'date': '05/06/2024'
      },
      {
        'title':
            "Étude de Cas : Réussite de la Transformation Numérique de l'Entreprise ABC",
        'imagePath': 'assets/blog_images/UnArticleABC-720x544.png',
        'text':
            "Découvrez comment nous avons aidé l'entreprise ABC à transformer son site web en une plateforme numérique moderne, en améliorant l'expérience utilisateur et en augmentant les conversions de 30%.",
        'boldTextList': [''],
        'date': '06/06/2024'
      },
      {
        'title':
            "Optimisation SEO pour les Sites Web en 2024 : Ce Que Vous Devez Savoir",
        'imagePath': 'assets/blog_images/homepage-concept-with-search-bar.jpg',
        'text':
            "Dans cet article, nous partageons les dernières techniques de SEO pour aider votre site web à se classer plus haut dans les résultats de recherche en 2024. De l'optimisation des mots-clés à l'amélioration de la vitesse de chargement, nous couvrons tout.",
        'boldTextList': [''],
        'date': '07/06/2024'
      },
      {
        'title':
            "Interview avec Notre Expert en UX/UI : L'Importance d'une Bonne Expérience Utilisateur",
        'imagePath':
            'assets/blog_images/ui-ux-design-informations-actualites.jpg',
        'text':
            "Plongez dans l'importance de l'expérience utilisateur avec notre expert en UX/UI, qui partage ses idées sur les meilleures pratiques et les tendances à suivre pour créer des interfaces intuitives et engageantes",
        'boldTextList': [''],
        'date': '08/06/2024'
      },
      {
        'title':
            "10 Meilleures Pratiques pour Optimiser les Performances de Votre Site Web",
        'imagePath':
            'assets/blog_images/18627-INF_KAN_PROD_APRIL_MEA-article_solution-ETL_website-2-18627-INF_KAN_PROD_APRIL_MEA-article_solution-ETL_website-2-1.jpg',
        'text':
            "Apprenez comment améliorer les performances de votre site web avec ces 10 meilleures pratiques, incluant l'optimisation des images, l'utilisation de CDN et bien plus.",
        'boldTextList': [''],
        'date': '09/06/2024'
      },
      {
        'title':
            "Les Dernières Tendances en Développement Web et Mobile en 2024",
        'imagePath': 'assets/blog_images/last_dev_tech_used.jpg',
        'text':
            "Explorez les nouvelles tendances en développement web et mobile qui marqueront 2024, et comment votre entreprise peut en tirer parti.",
        'boldTextList': [''],
        'date': '10/06/2024'
      },
    ];
    return BlogCardPattern(
      blogList: news,
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
