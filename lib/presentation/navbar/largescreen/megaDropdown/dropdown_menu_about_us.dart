import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_state.dart';
import 'package:ohana_webapp_flutter/presentation/constants/animation_constants.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_header_section.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navbar_link.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navbar_menu_title.dart';
import 'package:ohana_webapp_flutter/presentation/pages/responsive.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/social_media_buttons.dart';

class DropdownMenuAboutUs extends StatelessWidget {
  const DropdownMenuAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = Responsive.getScreenSizeWidth(context);
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
                DropdownHeaderSection(
                  title: "Découvrez-Nous",
                  description:
                      "Qui nous sommes, comment nous contater et où en savoir plus",
                  sectionWidth: sectionWidth,
                  paddingValue: paddingValue,
                  routeName: aboutUs,
                ),
                const VerticalDivider(),
                // 1st section
                // Container(
                //   width: sectionWidth,
                //   padding:
                //       EdgeInsets.only(left: paddingValue, right: paddingValue),
                //   child: const Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       NavbarMenuTitle(
                //         title: "OHana Entreprise",
                //         routeName: "",
                //       ),
                //       SizedBox(height: 10),
                //       NavbarLink(text: "NOTRE HISTOIRE", routeName: ""),
                //       SizedBox(height: 5),
                //       NavbarLink(text: "PROJETS REALISES", routeName: ""),
                //       SizedBox(height: 5),
                //       NavbarLink(text: "NOTRE EQUIPE", routeName: ""),
                //       SizedBox(height: 5),
                //       NavbarLink(text: "OU SOMMES-NOUS ?", routeName: ""),
                //     ],
                //   ),
                // ),
                // const VerticalDivider(),
                // 2nd section
                Container(
                  width: sectionWidth,
                  padding:
                      EdgeInsets.only(left: paddingValue, right: paddingValue),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NavbarMenuTitleContent(
                          globalColor: Colors.white, title: "Clients"),
                      SizedBox(height: 10),
                      NavbarLink(text: "NOS PARTENAIRES", routeName: ""),
                      SizedBox(height: 5),
                      NavbarLink(text: "DEVIS", routeName: estimate),
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
                      NavbarMenuTitleContent(
                          globalColor: Colors.white,
                          title: "Carrières et Blogs"),
                      SizedBox(height: 10),
                      SocialMediaButtons(),
                      SizedBox(height: 5),
                      NavbarLink(text: "BLOG", routeName: blog),
                      SizedBox(height: 5),
                      NavbarLink(text: "OFFRES D'EMPLOI", routeName: carreers)
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
