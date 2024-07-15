import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/job_offer/job_offer_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/job_offer/job_offer_state.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/job_offer/blocs/paginated_job_offer_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/job_offer/blocs/single_job_offer_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_screen_fit.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navbar_responsiveness.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/pages/carreersPage/widget/custom_job_offer_paginator.dart';
import 'package:ohana_webapp_flutter/presentation/pages/carreersPage/widget/job_offer_card.dart';
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
    super.initState();
    context.read<PaginatedJobOfferBloc>().add(FetchFirstJobOfferPage());
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavbarResponsiveness.getNavbar(screenSize.width),
      endDrawer: NavbarResponsiveness.getEndDrawer(screenSize.width),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              context.read<DropdownMenuBloc>().add(HideMenuEvent());
            },
            child: _content(screenSize, context),
          ),
          const DropdownMenuExpertises(),
          const DropdownMenuOffers(),
          const DropdownMenuAboutUs(),
          SearchNavBar(
            placeholder:
                "Cherchez une page, un service, un article, une offre d'emploi...",
          )
        ],
      ),
    );
  }

  Widget _content(Size screenSize, BuildContext context) {
    return SingleChildScrollView(
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
    );
  }

  Widget _getBanner({required Size screenSize}) {
    return CustomBanner(
      imagePath: 'assets/offers_images/person-with-hiring-sign-by-window.jpg',
      widget: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "REJOINDRE NOTRE EQUIPE ?",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomInputField(
                  placeholder: 'Chercher une offres',
                  textEditingController: TextEditingController(),
                ),
                const SizedBox(width: 10),
                Button("RECHERCHER", type: ButtonType.standard, onTap: () {}),
              ],
            ),
            _getExpertisesCards(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _getExpertisesCards() {
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

  Widget _getCustomExpertiseCard({required String svgPath}) {
    Color color = Colors.black.withOpacity(0.5);
    double size = 30;
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(top: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(partialCircularItem),
        color: color,
      ),
      child: SvgPicture.asset(svgPath, height: size, width: size),
    );
  }

  Widget _getCarrersItems(BuildContext context) {
    return BlocBuilder<PaginatedJobOfferBloc, JobOfferState>(
      builder: (context, state) {
        if (state is JobOfferLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (JobOffer item in state.jobOffersList)
                ResponsiveJobOfferCard(
                  id: '',
                  title: item.title,
                  keyWords: [
                    item.place,
                    item.contract,
                    item.duration,
                    item.salary != null ? item.salary.toString() : ''
                  ],
                  imagePath: item.imagePath,
                  date: item.pulishDate,
                  alert: item.alert,
                  onTap: () {
                    context.read<SingleJobOfferBloc>().add(ResetJobOffer());
                    context
                        .read<SingleJobOfferBloc>()
                        .add(FetchSingleJobOfferPage(item.id));
                    Navigator.of(context)
                        .pushNamed(singleCarreer, arguments: item.id);
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

  Widget _getListNumber() {
    return CustomJobOfferSmartPaginator();
  }
}
