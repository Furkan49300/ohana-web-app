import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/carreers/job_offer_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/carreers/job_offer_state.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/carreers/paginated_job_offer_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/carreers/single_job_offer_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_screen_fit.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navigation_bar_contents_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/pages/aboutUsPages/carreersPage/widget/custom_job_offer_paginator.dart';
import 'package:ohana_webapp_flutter/presentation/pages/aboutUsPages/carreersPage/widget/job_offer_card.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/input_field/custom_input_field.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';

class CarreersPageLargeScreen extends StatefulWidget {
  const CarreersPageLargeScreen({super.key});

  @override
  State<CarreersPageLargeScreen> createState() =>
      _CarreersPageLargeScreenState();
}

class _CarreersPageLargeScreenState extends State<CarreersPageLargeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PaginatedJobOfferBloc>().add(FetchFirstJobOfferPage());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
            SearchNavBar(
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
              _getBanner(screenSize: screenSize),
              const SizedBox(height: 30),
              _getCarrersItems(context),
              const SizedBox(height: 50),
              _getListNumber(),
              const SizedBox(height: 50),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

//BANNER
  _getBanner({required Size screenSize}) {
    return CustomBanner(
      imagePath: 'assets/offers_images/person-with-hiring-sign-by-window.jpg',
      widget: SizedBox(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //start at the start
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "REJOINDRE NOTRE EQUIPE ?",
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputField(
                placeholder: 'Chercher une offres',
                textEditingController: TextEditingController(),
              ),
              const SizedBox(
                width: 10,
              ),
              Button("RECHERCHER", type: ButtonType.standard, onTap: () {}),
            ],
          ),
          _getExpertisesCards(),
          const SizedBox(height: 100),
        ],
      )),
    );
  }

//get  svg of expertises
  _getExpertisesCards() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _getCustomExpertiseCard(
            svgPath: 'assets/services_icons/dev_services/devLogo.svg'),
        _getCustomExpertiseCard(
            svgPath: 'assets/services_icons/dev_services/design.svg'),
        _getCustomExpertiseCard(
            svgPath: 'assets/services_icons/dev_services/locked.svg'),
        _getCustomExpertiseCard(
            svgPath: 'assets/services_icons/dev_services/testValidate.svg'),
        _getCustomExpertiseCard(
            svgPath: 'assets/services_icons/dev_services/increase.svg'),
      ],
    );
  }

  _getCustomExpertiseCard({required String svgPath}) {
    Color color = Colors.black.withOpacity(0.5);
    double size = 30;
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(top: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(partialCircularItem),
        color: color,
      ),
      child: SvgPicture.asset(
        svgPath,
        height: size,
        width: size,
      ),
    );
  }

// OFFRES/CONTRACT
  _getCarrersItems(context) {
    return BlocBuilder<PaginatedJobOfferBloc, JobOfferState>(
      builder: (context, state) {
        if (state is JobOfferLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (JobOffer item in state
                  .jobOffersList) //LIST_OF_OFFERS is inside widget_utils.dart doc
                CustomJobOfferCard(
                  id: '',
                  title: item.title,
                  keyWords: [
                    item.place,
                    item.contract,
                    item.duration,
                    item.salary ?? ''
                  ],
                  imagePath: item.imagePath,
                  date: item.pulishDate,
                  alert: item.alert,
                  onTap: () {
                    context
                        .read<SingleJobOfferBloc>()
                        .add(FetchSingleJobOfferPage(item.id));
                    Navigator.of(context).pushNamed(singleCarreer);
                  },
                )
            ],
          );
        } else if (state is JobOfferError) {
          return Center(
            child: Text('Something is wrong :${state.errorMessage}'),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

//NUMBER LIST
  _getListNumber() {
    return const CustomJobOfferSmartPaginator(
        startIndicator: 1, endIndicator: 4);
  }
}
