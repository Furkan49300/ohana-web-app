import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_large_screen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navigation_bar_contents_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/bold_text_customiser.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_image_box.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_text_block.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/partners_carousel.dart';

class AboutUsLargeScreen extends StatelessWidget {
  const AboutUsLargeScreen({super.key});

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
        const CustomBanner(
            imagePath: 'assets/about_us_image/main_background_image.jpg'),
        const SizedBox(height: 40),
        _getAboutUsText(),
        const SizedBox(height: 40),
        _getOurSites(screenSize.width),
        const SizedBox(height: 70),
        _getOurValues(),
        const SizedBox(height: 70),
        _getOurTeamWork(screenSize.width),
        const SizedBox(height: 70),
        const PartnersCarousel(title: 'Nos Partners'),
        const SizedBox(height: 70),
        _getLocalisation(),
        const SizedBox(height: 70),
        FooterLargeScreen()
      ],
    );
  }
}

//Text about us
_getAboutUsText() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: spaceLeftBigTitle,
        ),
        CustomUnderlineTitle(
          title: 'Notre Entreprise',
        )
      ]),
      SizedBox(
        height: spaceBetweenBigTitleAndTextBody,
      ),
      Padding(
        padding: EdgeInsets.only(
            left: 1.5 * spaceLeftBigTitle, right: 1.5 * spaceLeftBigTitle),
        child: BoldTextCustomizer(
            text:
                " OHana Entreprise a été fondée en 2021 avec la vision de fournir des solutions informatiques innovantes et personnalisées à ses clients. Au fil des années, nous avons consolidé expertise dans le domaine de la conception de logiciels, d'applications web et mobiles, ainsi que dans le secteur de la cybersécurité.",
            boldTextList: ['OHana Entreprise', ' Notre mission']),
      ),
    ],
  );
}

//----OUR SITES

_getOurSites(mediaScreenWidth) {
  List<Map<String, dynamic>> ourSites = [
    {
      'place': 'France',
      'image': 'france.jpg',
      'text':
          "Lorem ipsum dolor,  sit amet consectetur adipisicing elit. Repellat vero accusamus perferendis veniam facilis, saepequod autem iure Lorem ipsum dolor,sit amet consectetur adipisicing elit. Repellat vero accusamus perferendis veniam facilis, saepe quod autem iure repudiandae assumenda dolore eos blanditiis officiis tempora, corporis sit cum  placeat eveniet!",
      'boldTextList': ['elit', 'accusamus perferendis']
    },
    {
      'place': 'Afrique',
      'image': 'afrique.jpg',
      'text':
          "Lorem ipsum dolor,  sit amet consectetur adipisicing elit. Repellat vero accusamus perferendis veniam facilis, saepequod autem iure Lorem ipsum dolor,sit amet consectetur adipisicing elit. Repellat vero accusamus perferendis veniam facilis, saepe quod autem iure repudiandae assumenda dolore eos blanditiis officiis tempora, corporis sit cum  placeat eveniet!",
      'boldTextList': ['elit', 'accusamus perferendis']
    },
  ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: spaceLeftBigTitle,
        ),
        CustomUnderlineTitle(
          title: 'Nos Sites',
        )
      ]),
      const SizedBox(
        height: spaceBetweenBigTitleAndTextBody,
      ),
      for (var item in ourSites)
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: _getSingleSiteView(
              mediaScreenWidth: mediaScreenWidth,
              place: item['place'],
              image: item['image'],
              text: item['text'],
              boldTextList: item['boldTextList']),
        ),
    ],
  );
}

_getSingleSiteView({mediaScreenWidth, place, image, text, boldTextList}) {
  return Container(
      width: mediaScreenWidth,
      height: 400, //it's important, it enable to spread items
      padding: const EdgeInsets.only(
        left: 1.5 * spaceLeftBigTitle,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 70,
              ),
              CustomUnderlineTitle(
                title: place,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 1000, //Control the width of Article
                child:
                    BoldTextCustomizer(text: text, boldTextList: boldTextList),
              )
            ],
          ),
          Positioned(
              right: 15,
              top: 0,
              child: CustomImageBox(
                imagePath: image,
              ))
        ],
      ));
}

//-----OUR VALUES

_getOurValues() {
  List<Map<String, String>> ourPrinciples = [
    {
      'svgName': 'medal.svg',
      'title': "L'Excellence",
      "text":
          "Necessitatibus voluptatum, consequuntur magnam numquam corporis est optio laudantium placeat",
    },
    {
      'svgName': 'heart.svg',
      'title': "L'intégrité",
      "text":
          "Necessitatibus voluptatum, consequuntur magnam numquam corporis est optio laudantium placeat",
    },
    {
      'svgName': 'trust-wallet-svgrepo-com.svg',
      'title': "Confiance",
      "text":
          "Necessitatibus voluptatum, consequuntur magnam numquam corporis est optio laudantium placeat",
    },
    {
      'svgName': 'rocket-innovation-space-svgrepo-com.svg',
      'title': "L'innovation",
      "text":
          "Necessitatibus voluptatum, consequuntur magnam numquam corporis est optio laudantium placeat",
    },
    {
      'svgName': 'burning-passion-svgrepo-com.svg',
      'title': "Passion",
      "text":
          "Necessitatibus voluptatum, consequuntur magnam numquam corporis est optio laudantium placeat",
    },
  ];

  return Column(
    // crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      const CustomUnderlineTitle(
        title: 'Nos Valeurs',

        // start: true,
        // lineSize: 180,
      ),
      const SizedBox(
        height: 50,
      ),
      Wrap(
        spacing: 50,
        children: [
          for (var item in ourPrinciples)
            _getSingleValueBlock(
                svgName: item['svgName'],
                title: item['title'],
                text: item['text'])
        ],
      )
    ],
  );
}

_getSingleValueBlock({svgName, title, text}) {
  return Container(
    width: 310,
    height: 375,
    decoration: BoxDecoration(
      // border: Border.all(width: 0.2),
      color: Colors.white,
      borderRadius: BorderRadius.circular(partialCircularItem),
      boxShadow: [
        BoxShadow(
          color:
              Colors.grey.withOpacity(0.4), // Couleur de l'ombre avec opacité
          spreadRadius: 5, // Rayon de diffusion de l'ombre
          blurRadius: 7, // Rayon de flou de l'ombre
          offset: const Offset(0, 3),
        ),
      ],
    ),
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(completeCirvularItem),
            color: Colors.purple,
          ),
          child: SvgPicture.asset(
            svgName,
            height: 100,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            text,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    ),
  );
}

//------Our TEAM
_getOurTeamWork(mediaScreenWidth) {
  return Container(
      padding: const EdgeInsets.only(left: spaceLeftBigTitle),
      width: mediaScreenWidth,
      child: const CustomTextBlock(
        image:
            'assets/about_us_image/group-people-holding-hand-assemble-togetherness.jpg',
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'À Propos de Notre Équipe',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            BoldTextCustomizer(
                width: 800,
                text:
                    'Chez OHana Entreprise, nous sommes fiers de notre équipe dévouée et talentueuse qui œuvre chaque jour pour offrir des solutions innovantes et personnalisées à nos clients. Notre équipe est composée de professionnels passionnés par le développement web et mobile, chacun apportant son expertise unique et sa créativité au service de vos projets.',
                boldTextList: ['OHana Entreprise']),
            SizedBox(
              height: 10,
            ),
            BoldTextCustomizer(
                width: 800,
                text:
                    "Que ce soit pour la conception d'un site web intuitif, le développement d'une application mobile performante ou la mise en place de solutions sur mesure, notre équipe est là pour vous accompagner à chaque étape du processus. Forts d'une expérience diversifiée et d'une volonté constante d'excellence, nous sommes toujours à l'affût des dernières technologies et tendances du marché pour vous garantir des solutions à la pointe de l'innovation.",
                boldTextList: ['']),
          ],
        ),
      ));
}

// OUR MAP POSITION

_getLocalisation() {
  return SizedBox();
}

//---------
