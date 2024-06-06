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
import 'package:ohana_webapp_flutter/presentation/widgets/composants/expertises_card.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/circular_text_overlay.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/custom_icon_button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/partners_carousel.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/strong_points_section.dart';

class HomePageLargeScreen extends StatelessWidget {
  const HomePageLargeScreen({super.key});

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
              // const Text('HOME PAGE LARGE SCREEN !!!!!!'),
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.of(context).pushNamed('/contact-us');
              //     },
              //     child: const Text('Go to contact'))
              const CustomBanner(
                message: "BIENVENUE A OHANA ENTREPRISE",
                imagePath:
                    'assets/homepage_image/programming-background-collage.jpg',
              ),
              const ExpertisesList(),
              const SizedBox(height: 70),
              const StrongPointsSection(),
              const SizedBox(height: 50),
              const OurPartners(),
              const SizedBox(height: 50),
              const CustomTextCircleImage(),
              const SizedBox(height: 50),
              FooterLargeScreen(
                mediaScreenWidth: screenSize.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//----EXPERTISE

class ExpertisesList extends StatelessWidget {
  const ExpertisesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.only(top: 10),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: spaceLeftBigTitle,
              ),
              CustomUnderlineTitle(
                title: 'Expertises',
              )
            ],
          ),
          SizedBox(
            height: spaceBetweenBigTitleAndTextBody,
          ),
          Wrap(
            spacing: 40, //horizontal space between children
            alignment: WrapAlignment.center,
            children: [
              ExpertisesCard(
                  svgLink: 'dev_services/devLogo.svg',
                  title: 'DÉVELOPPEMENT  LOGICIELS'),
              ExpertisesCard(
                  svgLink: 'dev_services/design.svg', title: 'DESIGN'),
              ExpertisesCard(
                  svgLink: 'dev_services/locked.svg', title: 'CYBERSECURITÉ'),
              ExpertisesCard(
                  svgLink: 'dev_services/ref.svg', title: 'RÉFÉRENCEMENT'),
              ExpertisesCard(
                  svgLink: 'dev_services/testValidate.svg', title: 'TESTING'),
              ExpertisesCard(
                  svgLink: 'dev_services/increase.svg', title: 'IA GENERATIVE'),
            ],
          )
        ],
      ),
    );
  }

  _getExpertiseBloc(String svgLink, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.purple,
        //borderRadius: BorderRadius.circular(20),
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
      child: Column(
        children: [
          CustomIconButton(
            iconPath: 'assets/services_icons/$svgLink',
            hoverDisabled: true,
            size: 200,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
    );
  }
}

//----OUR PARTNER

class OurPartners extends StatelessWidget {
  const OurPartners({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomUnderlineTitle(title: 'IL NOUS FONT CONFIANCE'),
        SizedBox(height: spaceBetweenBigTitleAndTextBody),
        PartnersCarousel(),
      ],
    );
  }
}
