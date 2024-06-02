import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:google_fonts/google_fonts.dart";

import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_state.dart';
import 'package:ohana_webapp_flutter/presentation/constants/animation_constants.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navbar_link.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navbar_menu_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/social_media_buttons.dart';

class DropdownMenuAboutUs extends StatelessWidget {
  const DropdownMenuAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;
    double paddingValue =
        screenSizeWidth * 0.02; // 5% of screen width as padding
    double sectionWidth = (screenSizeWidth / 4) - 20;

    return BlocBuilder<DropdownMenuBloc, DropdownMenuState>(
        builder: (context, state) {
      return AnimatedOpacity(
        opacity: state is AboutUsMenuShowedState ? 1 : 0,
        duration: animationStandardDuration,
        child: AnimatedContainer(
          duration: animationStandardDuration,
          height: state is AboutUsMenuShowedState ? 300 : 0,
          color: purpleNeutral,
          child: Padding(
            padding: EdgeInsets.only(top: paddingValue, bottom: paddingValue),
            child: Row(
              children: [
                // header section
                Container(
                  width: sectionWidth,
                  padding:
                      EdgeInsets.only(left: paddingValue, right: paddingValue),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Découvrez-Nous",
                        style: GoogleFonts.majorMonoDisplay(
                            color: Colors.white, fontSize: 30),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Qui nous sommes, comment nous contater et où en savoir plus",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
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
                        title: "OHana Entreprise",
                        routeName: "",
                      ),
                      SizedBox(height: 10),
                      NavbarLink(text: "NOTRE HISTOIRE", routeName: ""),
                      SizedBox(height: 5),
                      NavbarLink(text: "PROJETS REALISES", routeName: ""),
                      SizedBox(height: 5),
                      NavbarLink(text: "NOTRE EQUIPE", routeName: ""),
                      SizedBox(height: 5),
                      NavbarLink(text: "OU SOMMES-NOUS ?", routeName: ""),
                    ],
                  ),
                ),
                const VerticalDivider(),
                // 2nd section
                Container(
                  width: sectionWidth,
                  padding:
                      EdgeInsets.only(left: paddingValue, right: paddingValue),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NavbarMenuTitle(
                        title: "Clients",
                        routeName: "",
                      ),
                      SizedBox(height: 10),
                      NavbarLink(text: "NOS PARTENAIRES", routeName: ""),
                      SizedBox(height: 5),
                      NavbarLink(text: "DEVIS", routeName: ""),
                      SizedBox(height: 5),
                      NavbarLink(
                          text: "CONTACTEZ-NOUS !", routeName: contactUs),
                    ],
                  ),
                ),
                const VerticalDivider(),
                // 3rd section
                Container(
                  width: sectionWidth,
                  padding:
                      EdgeInsets.only(left: paddingValue, right: paddingValue),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NavbarMenuTitle(
                        title: "Carrières et Blogs",
                        routeName: "",
                      ),
                      SizedBox(height: 10),
                      SocialMediaButtons(),
                      SizedBox(height: 5),
                      NavbarLink(text: "BLOG", routeName: ""),
                      SizedBox(height: 5),
                      NavbarLink(text: "OFFRES D'EMPLOI", routeName: ""),
                      SizedBox(height: 5),
                      NavbarLink(text: "ESPACE CANDIDAT", routeName: ""),
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
