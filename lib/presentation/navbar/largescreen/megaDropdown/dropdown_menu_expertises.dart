import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_state.dart';
import 'package:ohana_webapp_flutter/presentation/constants/animation_constants.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navbar_link.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navbar_menu_title.dart';

class DropdownMenuExpertises extends StatelessWidget {
  const DropdownMenuExpertises({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;
    double paddingValue =
        screenSizeWidth * 0.02; // 5% of screen width as padding
    double sectionWidth = (screenSizeWidth / 3) - 20;

    return BlocBuilder<DropdownMenuBloc, DropdownMenuState>(
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state is ExpertisesMenuShowedState ? 1 : 0,
          duration: animationStandardDuration,
          child: AnimatedContainer(
            duration: animationStandardDuration,
            height: state is ExpertisesMenuShowedState ? 300 : 0,
            color: purpleNeutral,
            child: Padding(
              padding: EdgeInsets.only(top: paddingValue, bottom: paddingValue),
              child: Row(
                children: [
                  // header section
                  Container(
                    width: sectionWidth,
                    padding: EdgeInsets.only(
                        left: paddingValue, right: paddingValue),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expertises",
                          style: GoogleFonts.majorMonoDisplay(
                              color: Colors.white, fontSize: 30),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Découvre l'ensemble de nos services conçus pour répondre à vos besoins technologiques et de sécurité",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  const VerticalDivider(),
                  // 1st section
                  Container(
                    width: sectionWidth,
                    padding: EdgeInsets.only(
                        left: paddingValue, right: paddingValue),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NavbarMenuTitle(
                          title: "Services de développement",
                          routeName: devServices,
                        ),
                        SizedBox(height: 10),
                        NavbarLink(text: "WEB", routeName: web),
                        SizedBox(height: 5),
                        NavbarLink(text: "MOBILE", routeName: mobile),
                        SizedBox(height: 5),
                        NavbarLink(text: "LOGICIELS", routeName: softwares),
                        SizedBox(height: 5),
                        NavbarLink(text: "DESIGN", routeName: design),
                        SizedBox(height: 5),
                        NavbarLink(text: "REFERENCEMENT (SEO)", routeName: seo),
                        SizedBox(height: 5),
                        NavbarLink(text: "IA GENERATIVE", routeName: ai),
                      ],
                    ),
                  ),
                  const VerticalDivider(),
                  // 2nd section
                  Container(
                    width: sectionWidth,
                    padding: EdgeInsets.only(
                        left: paddingValue, right: paddingValue),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NavbarMenuTitle(
                          title: "Services cybersécurité",
                          routeName: cyberServices,
                        ),
                        SizedBox(height: 10),
                        NavbarLink(
                            text: "AUDIT DE SECURITE",
                            routeName: securityAudit),
                        SizedBox(height: 5),
                        NavbarLink(
                            text: "AUDIT DE VULNERABILITE",
                            routeName: vulnerabilityAudit),
                        SizedBox(height: 5),
                        NavbarLink(
                            text: "AUDIT DE CONFORMITE",
                            routeName: complianceAudit),
                        SizedBox(height: 5),
                        NavbarLink(text: "PENTESTING", routeName: pentesting),
                        SizedBox(height: 5),
                        NavbarLink(
                            text: "ACCOMPAGNEMENT SUR MESURE",
                            routeName: tailorMadeSupport),
                        SizedBox(height: 5),
                        NavbarLink(
                            text: "SECURISATION CODE LOGICIELS",
                            routeName: softwareCodeSecurity),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
