import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_large_screen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navigation_bar_contents_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/pages/offersPages/MAINPAGE/widgets/circular_image_loader.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';

class OffersPageLargeScreen extends StatefulWidget {
  const OffersPageLargeScreen({super.key});

  @override
  State<OffersPageLargeScreen> createState() => _OffersPageLargeScreenState();
}

class _OffersPageLargeScreenState extends State<OffersPageLargeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _getBanner(),
              const SizedBox(height: 70),
              const Text(
                'Que Faisons Nous Pour Nos Clients',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              const SizedBox(
                width: 900,
                child: Text(
                  'Notre entreprise est spécialisée dans le développement web et mobile sur mesure. Nous offrons une gamme complète de services, allant de la conception à la mise en œuvre, en passant par la consultation stratégique',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19),
                ),
              ),
              const SizedBox(height: 100),
              _getOffersSections(),
              const SizedBox(height: 40),
              const Text(
                'Contatez-Nous',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              const SizedBox(
                width: 900,
                child: Text(
                  "Besoin d'aide ou de plus d'informations ? Contactez-nous dès aujourd'hui et découvrez comment nous pouvons transformer vos idées en réalité numérique !",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19),
                ),
              ),
              const SizedBox(height: 10),
              Button('Contactez-Nous', type: ButtonType.standard, onTap: () {}),
              const SizedBox(height: 40),
              FooterLargeScreen(
                mediaScreenWidth: screenSize.width,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getBanner() {
    return const CustomBanner(
      imagePath:
          'assets/offers_images/programming-software-code-application-technology-concept.jpg',
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Nos Offres',
            style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Colors.purple),
          ),
          SizedBox(height: 10),
          Text(
              ' Découvrez nos solutions pour répondre à vos besoins numériques',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple)),
        ],
      ),
    );
  }

  CarouselSlider _getOffersSections() {
    List<List> offersList = [
      [
        {
          'title': 'Conception web sur mesure',
          'imagePath':
              'assets/offers_images/construction-building-architecture-concept.jpg',
          'svgLink': 'assets/offers_svg/setting-4-svgrepo-com.svg',
          'description':
              'Création de sites web adaptés à vos besoins spécifiques, alliant design élégant et fonctionnalités avancées.',
        },
        {
          'title': 'E-commerce puissant',
          'imagePath':
              'assets/offers_images/black-gift-with-discount-tag-cart.jpg',
          'svgLink': 'assets/offers_svg/commerce-tag-svgrepo-com.svg',
          'description':
              'Mise en place de boutiques en ligne robustes, sécurisées et conviviales pour stimuler vos ventes et votre croissance',
        },
        {
          'title': 'Optimisation de la présence en ligne',
          'imagePath':
              'assets/offers_images/woman-sitting-bed-with-laptop-phone.jpg',
          'svgLink': 'assets/offers_svg/optimization-svgrepo-com.svg',
          'description':
              ' Amélioration de la visibilité et de la performance de votre site web pour attirer plus de clients et augmenter votre impact.',
        },
        {
          'title': 'Applications mobiles sur mesure',
          'imagePath': 'assets/offers_images/IMG_9596-2.png',
          'svgLink': 'assets/offers_svg/mobile-app-svgrepo-com.svg',
          'description':
              'Développement d\'applications iOS et Android personnalisées pour offrir une expérience utilisateur exceptionnelle.',
        },
        {
          'title': 'Engagement accru',
          'imagePath':
              'assets/offers_images/high-angle-young-people-praying-outdoors.jpg',
          'svgLink': 'assets/offers_svg/engagement-svgrepo-com.svg',
          'description':
              'Création d\'applications mobiles interactives et engageantes pour fidéliser vos utilisateurs et stimuler leur rétention',
        },
        {
          'title': 'Monétisation efficace',
          'imagePath':
              'assets/offers_images/woman-holding-her-finger-balance-with-coins.jpg',
          'svgLink': 'assets/offers_svg/public-funds-people-svgrepo-com.svg',
          'description':
              'Intégration de stratégies de monétisation innovantes pour maximiser vos revenus à partir de vos applications mobiles',
        },
      ],
      [
        {
          'title': 'Analyse approfondie des besoins ',
          'imagePath':
              'assets/offers_images/team-young-colleagues-having-meeting-cafe.jpg',
          'svgLink': 'assets/offers_svg/analyze-svgrepo-com.svg',
          'description':
              'Évaluation détaillée de vos objectifs et de vos défis pour élaborer une stratégie de développement adaptée à votre entreprise.',
        },
        {
          'title': 'Conseils experts ',
          'imagePath':
              'assets/offers_images/blonde-woman-having-conversation-with-work-colleague.jpg',
          'svgLink': 'assets/offers_svg/help-svgrepo-com.svg',
          'description':
              'Expertise et conseils pour vous aider à prendre les bonnes décisions en matière de technologie et de stratégie numérique.',
        },
        {
          'title': 'Suivi personnalisé',
          'imagePath':
              'assets/offers_images/multitasking-busy-woman-with-many-arms-doing-many-tasks-at-the-same-time-flat-illustration-concept-freelancer-character-work-from-home-office-time-management-data-analysis-busin.jpg',
          'svgLink': 'assets/offers_svg/followers-svgrepo-com.svg',
          'description':
              'Accompagnement tout au long du processus, de la conception initiale à la mise en œuvre finale, pour garantir le succès de votre projet.',
        },
        {
          'title': 'Expérience utilisateur immersive ',
          'imagePath': 'assets/offers_images/user-experience.jpg',
          'svgLink': 'assets/offers_svg/user-speak-svgrepo-com.svg',
          'description':
              'Conception d\'interfaces utilisateur intuitives et attrayantes pour offrir une navigation fluide et agréable à vos utilisateurs.',
        },
        {
          'title': 'Optimisation de la convivialité',
          'imagePath':
              'assets/offers_images/Optimisation_de_la_convivialité.jpeg',
          'svgLink': 'assets/offers_svg/people-2-svgrepo-com.svg',
          'description':
              "Analyse et amélioration continue de l'ergonomie de votre application ou de votre site web pour une expérience utilisateur optimale.",
        },
        {
          'title': 'Esthétique élégante',
          'imagePath': 'assets/offers_images/IA-9.png',
          'svgLink': 'assets/offers_svg/beauty-svgrepo-com.svg',
          'description':
              ' Création de designs visuellement captivants qui renforcent l\'identité de votre marque et attirent l\'attention de votre public cible.',
        },
      ]
    ];
    return CarouselSlider(
        options: CarouselOptions(
          // clipBehavior: Clip.none,
          // height: screenHeight / 1.5,
          height: 800,
          viewportFraction: 1,
        ),
        items: offersList
            .map((list) => Wrap(
                  spacing: 250,
                  children: list
                      .map((offers) => _getCard(
                          imagePath: offers['imagePath'],
                          title: offers['title'],
                          description: offers['description'],
                          svgLink: offers['svgLink']))
                      .toList(),
                ))
            .toList());
  }

  Column _getCard({
    required String imagePath,
    required String title,
    required String description,
    required String svgLink,
  }) {
    double widthBox = 320;
    double svgSize = 30;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircularImageLoader(
          imagePath: imagePath,
          width: widthBox,
          height: 200,
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              svgLink,
              height: svgSize,
              width: svgSize,
              colorFilter:
                  const ColorFilter.mode(purpleNeutral, BlendMode.srcIn),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: widthBox - svgSize,
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            )
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: widthBox,
          child: Text(description, style: const TextStyle(fontSize: 15)),
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_right,
              color: purpleNeutral,
              size: 20,
            ),
            SizedBox(width: 2),
            Text(
              'voir plus',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: purpleNeutral),
            )
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
