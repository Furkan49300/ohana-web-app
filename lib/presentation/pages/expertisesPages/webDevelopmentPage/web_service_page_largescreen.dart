import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_text_list.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/text_wrap_with_title.dart';
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
              'Bienvenue chez OHana Entreprse, votre partenaire de confiance pour le développement de sites web professionnels et innovants. Nous transformons vos idées en une présence en ligne engageante et performante. Notre équipe de développeurs web qualifiés conçoit et développe des sites web sur mesure pour répondre aux besoins spécifiques de nos clients. Nous accordons une attention particulière à la convivialité et à la performance',
        ),
        _getTextCustomCard(),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        _getCatalogList(),
        const SizedBox(
          height: 10,
        ),
        _getCustomImage(
            title: 'Nous restons à votre service',
            imagePath:
                'assets/services_images/services_acceuil_official_free_image.webp'),
        const SizedBox(
          height: 10,
        ),
        FooterLargeScreen(mediaScreenWidth: screenSize.width)
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
        const SizedBox(
          height: 90,
        ),
        CustomTextBlock(
          image:
              'assets/services_images/dev_services/web/representations-ui-ux-ordinateur-portable_23-2150201871.jpg',
          title: 'Nos Services',
          widget: BoldTextCustomizer(
              width: textWidth,
              text:
                  'Conception de Sites Web Personnalisés Nous créons des sites web sur mesure qui reflètent parfaitement l\'identité de votre marque. Nos designs sont modernes, intuitifs et adaptés à vos besoins spécifiques.',
              boldTextList: const ['Conception de Sites Web']),
        ),
        CustomTextBlock(
          image:
              'assets/services_images/dev_services/web/homepage-seen-computer-screen.jpg',
          textDirection: rtlDirection,
          title: 'Développement site responsive',
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
          title: 'Maintenance et Support',
          widget: Column(
            children: [
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

  _getOnlyText({title = '', text, required List<String> boldTextList}) {
    //TO DO IMPLEMENTS
    return SizedBox();
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
  _getCatalogList() {
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
