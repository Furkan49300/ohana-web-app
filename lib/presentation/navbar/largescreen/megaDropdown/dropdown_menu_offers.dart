import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:google_fonts/google_fonts.dart";

import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_state.dart';
import 'package:ohana_webapp_flutter/presentation/constants/animation_constants.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_header_section.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navbar_link.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navbar_menu_title.dart';

class DropdownMenuOffers extends StatelessWidget {
  const DropdownMenuOffers({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;
    double paddingValue =
        screenSizeWidth * 0.02; // 5% of screen width as padding
    double sectionWidth = (screenSizeWidth / 2) - 10;

    return BlocBuilder<DropdownMenuBloc, DropdownMenuState>(
        builder: (context, state) {
      return AnimatedOpacity(
        opacity: state is OffersMenuShowedState ? 1 : 0,
        duration: animationStandardDuration,
        child: AnimatedContainer(
          duration: animationStandardDuration,
          height: state is OffersMenuShowedState ? 300 : 0,
          color: purpleNeutral,
          child: Padding(
            padding: EdgeInsets.only(top: paddingValue, bottom: paddingValue),
            child: Row(
              children: [
                // header section
                DropdownHeaderSection(
                  title: "Offres",
                  description:
                      "Profitez de nos solutions, adaptées à chaque budget, pour booster votre entreprise dès aujourd'hui",
                  sectionWidth: sectionWidth,
                  paddingValue: paddingValue,
                  routeName: offers,
                ),
                const VerticalDivider(),
                // 1st section
                Container(
                  width: sectionWidth,
                  padding:
                      EdgeInsets.only(left: paddingValue, right: paddingValue),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NavbarMenuTitle(
                        title: "Nos offres",
                        routeName: "",
                      ),
                      SizedBox(height: 10),
                      NavbarLink(text: "PRODUITS SUR MESURE", routeName: ""),
                      SizedBox(height: 5),
                      NavbarLink(text: "CONSEIL", routeName: ""),
                      SizedBox(height: 5),
                      NavbarLink(
                          text: "PRODUCTION DESIGN SPRINT", routeName: ""),
                      SizedBox(height: 5),
                      NavbarLink(text: "CATALOGUE TARIFS", routeName: ""),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
