import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/carreers/job_offer_state.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/carreers/blocs/single_job_offer_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/default_values.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_screen_fit.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navigation_bar_contents_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_text_list.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';

class SingleCarreerPageLargeScreen extends StatelessWidget {
  const SingleCarreerPageLargeScreen({super.key});

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
            SearchNavBar(
              placeholder:
                  "Cherchez une page, un service, un article, une offre d'emploi...",
            )
          ],
        ));
  }

  _content(Size screenSize, BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: BlocBuilder<SingleJobOfferBloc, JobOfferState>(
          builder: (context, state) {
            if (state is SingleJobOfferLoaded) {
              try {
                return Column(
                  children: [
                    const SizedBox(height: 50),
                    Image.asset(
                      state.jobOffers.imagePath != '' &&
                              state.jobOffers.imagePath != null
                          ? state.jobOffers.imagePath
                          : jobDefaultImage,
                      width: screenSize.width * 0.55,
                      height: 300,
                    ),
                    const SizedBox(height: 20),
                    _getHeader(state.jobOffers, context),
                    const SizedBox(height: 40),
                    _getBodyText(screenSize, state.jobOffers),
                    const SizedBox(height: 50),
                    const SizedBox(height: 40),
                    const CustomUnderlineTitle(
                      title: "Propositions similaires",
                    ),
                    const SizedBox(height: 40),
                    _getOtherSimilarJob(),
                    const Footer(),
                  ],
                );
              } catch (error) {
                return _getErrorMessage(
                    screenSize, 'Something went wrong (build error) : $error');
              }
            } else if (state is JobOfferInitialState) {
              return _getErrorMessage(screenSize, 'is Loading...');
            } else if (state is JobOfferError) {
              return _getErrorMessage(screenSize,
                  'Something went wrong (state error) :  ${state.errorMessage}');
            } else {
              return _getErrorMessage(
                  screenSize, 'Something went wrong (error)');
            }
          },
        ),
      ),
    );
  }

  _getHeader(JobOffer jobOffer, BuildContext context) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    return Column(
      children: [
        Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 50,
            children: [
              Text(jobOffer.title,
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold)),
              ClipRRect(
                borderRadius: BorderRadius.circular(partialCircularItem),
                child: Button(
                  'Postuler',
                  type: ButtonType.standard,
                  paddingLeftRight: 30.0,
                  paddingTopBottom: 5.0,
                  fontSizeVal: 24,
                  onTap: () {
                    Navigator.of(context).pushNamed(apply);
                  },
                ),
              )
            ]),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(
              jobOffer.place,
              style: const TextStyle(fontSize: 19),
            ),
            const VerticalDivider(),
            Text(
              dateFormat.format(jobOffer.pulishDate),
              style: const TextStyle(fontSize: 19),
            ),
            const VerticalDivider(),
            Text(
              jobOffer.contract,
              style: const TextStyle(fontSize: 19),
            ),
            const VerticalDivider(),
            Text(
              jobOffer.duration,
              style: const TextStyle(fontSize: 19),
            ),
            const VerticalDivider(),
            Text(
              jobOffer.salary ?? "",
              style: const TextStyle(fontSize: 19),
            ),
          ]),
        )
      ],
    );
  }

  _getBodyText(Size screenSize, JobOffer jobOffer) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //PART OF DESCRIPTION

        const CustomUnderlineTitle(title: 'Description'),
        const SizedBox(height: 40),
        SizedBox(
          width: screenSize.width * 0.55,
          child: Text(
            jobOffer.description,
            style: const TextStyle(fontSize: 19),
          ),
        ),
        const SizedBox(height: 50),

        //PART OF MISSION

        // const CustomUnderlineTitle(
        //   title: 'Missions',
        // ),
        // const SizedBox(height: 40),
        // SizedBox(
        //     width: screenSize.width * 0.55,
        //     child: const CustomListText(
        //       fontSize: 19,
        //       textList: [
        //         "Développement Mobile : Concevoir et développer des applications mobiles de haute qualité pour les plateformes iOS et Android, en utilisant les meilleures pratiques de développement.",
        //         "Cybersécurité : Implémenter des mesures de sécurité robustes pour protéger les données des utilisateurs et assurer la conformité avec les normes de sécurité.",
        //         "Maintenance : Effectuer la maintenance et les mises à jour régulières des applications existantes pour améliorer la performance et la sécurité.",
        //         "Collaboration : Travailler en étroite collaboration avec les équipes de développement, de conception et de sécurité pour assurer l'intégration transparente des fonctionnalités de sécurité.",
        //         "Revues de Code : Participer aux revues de code pour identifier et corriger les vulnérabilités de sécurité potentielles."
        //       ],
        //     )),
        // const SizedBox(height: 50),

        //PART OF PROFIL

        const CustomUnderlineTitle(
          title: 'Profil recherché',
        ),
        const SizedBox(height: 40),
        SizedBox(
            width: screenSize.width * 0.55,
            child: CustomListText(
              fontSize: 19,
              textList: jobOffer.profil.map((item) => item.toString()).toList(),
            )),

        //PART OF ADVANTAGES

        const CustomUnderlineTitle(
          title: 'Avantages',
        ),
        const SizedBox(height: 40),
        SizedBox(
            width: screenSize.width * 0.55,
            child: CustomListText(
              fontSize: 19,
              textList:
                  jobOffer.advantages.map((item) => item.toString()).toList(),
            )),
        const SizedBox(height: 30),
        //Encouragement
        SizedBox(
          width: screenSize.width * 0.55,
          child: const Text(
              "Rejoignez-nous et contribuez à façonner l'avenir de la technologie mobile et de la cybersécurité. Postulez dès maintenant pour faire partie de notre équipe innovante !",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
        )
      ],
    );
  }

  _getOtherSimilarJob() {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 70),
      child: Wrap(
        spacing: 100,
        alignment: WrapAlignment.center,
        children: [
          _getJobItem(
              title: 'Développement mobile',
              imagePath:
                  'assets/offers_images/original-a76def72cdea25d560956e824f479901.png'),
          _getJobItem(
              title: 'Développement mobile',
              imagePath:
                  'assets/offers_images/avntages-inconvennients-flutter-application-mobile-hybride_banner.jpg'),
          _getJobItem(
              title: 'Développement d\'application e-commerce',
              imagePath:
                  'assets/services_images/dev_services/ecommerce_mobile_app_design.jpg'),
          _getJobItem(
              title: 'Développement web',
              imagePath: 'assets/services_images/dev_services/computer.jpeg'),
          _getJobItem(
              title: 'Développeur Landing Page',
              imagePath:
                  'assets/services_images/dev_services/catalog_images/landingPage.jpg'),
          _getJobItem(
              title: 'Gestion de réferencement',
              imagePath:
                  'assets/services_images/dev_services/catalog_images/accomodation.jpg'),
        ],
      ),
    );
  }

  _getJobItem({required String title, required String imagePath}) {
    const double boxWidth = 400.0;
    const Color color = Color(0xffD9D9D9);
    const EdgeInsets padding =
        EdgeInsets.only(left: 10, right: 10, top: 5.0, bottom: 5.0);
    const EdgeInsets margin = EdgeInsets.only(bottom: 5.0);
    //responsive item
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        width: boxWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 250,
              width: boxWidth,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Wrap(
              // keys Words of this Job
              alignment: WrapAlignment.start,
              spacing: 10,
              children: [
                Container(
                  color: color,
                  padding: padding,
                  margin: margin,
                  child: const Text("Stage"),
                ),
                Container(
                  margin: margin,
                  color: color,
                  padding: padding,
                  child: const Text("2 mois"),
                ),
                Container(
                  color: color,
                  padding: padding,
                  margin: margin,
                  child: const Text("Télétravail"),
                ),
                Container(
                  color: color,
                  padding: padding,
                  margin: margin,
                  child: const Text("Paris Trappes 85 rue"),
                ),
                Container(
                  color: color,
                  padding: padding,
                  margin: margin,
                  child: const Text("605€-1600€"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.centerRight,
                child: Button(
                  'Voir Plus',
                  type: ButtonType.standard,
                  onTap: () {},
                  paddingLeftRight: 10,
                  paddingTopBottom: 10,
                ))
          ],
        ),
      ),
    );
  }

  SizedBox _getErrorMessage(Size screenSize, String text) {
    return SizedBox(
        height: screenSize.height * 0.7,
        child: Center(
          child: Text(text,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ));
  }
}
