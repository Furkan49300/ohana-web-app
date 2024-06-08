import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/logo.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/social_media_buttons.dart';

class FooterLargeScreen extends StatelessWidget {
  const FooterLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        _getFooterTopSection(),
        Container(height: 370, color: purpleLight),
        _getFooterBottomSection(screenSizeWidth)
      ],
    );
    /*return Container(
      color: Colors.purple,
      width: screenSizeWidth,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.only(left: spaceLeftBigTitle - 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _getColumnOfLink(
                  footerLinks['column1'],
                ),
                const SizedBox(
                  width: 50,
                ),
                _getColumnOfLink(footerLinks['column2']),
                const SizedBox(
                  width: 50,
                ),
                _getColumnOfLink(footerLinks['column3']),
              ],
            ),
            //---Legale mention
            const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '@mention légale',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );*/
  }

  _getFooterTopSection() {
    return Container(
      height: 130,
      color: purpleNeutral,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _getFooterTopItem(
              icon: Icons.place,
              title: "ADRESSE",
              content: "15 Rue des Peupliers, 49000 Angers, France"),
          _getDivider(),
          _getFooterTopItem(
              icon: Icons.phone,
              title: "TELEPHONE",
              content: "+337 07 77 77 77"),
          _getDivider(),
          _getFooterTopItem(
              icon: Icons.email,
              title: "EMAIL",
              content: "ohana@entreprise.com"),
          _getDivider(),
          _getFooterTopItem(
              icon: Icons.access_time,
              title: "HORAIRES",
              content: "Du Lundi au Vendredi,\n9h - 17h"),
        ],
      ),
    );
  }

  _getFooterBottomSection(double screenSizeWidth) {
    return Container(
      height: 40,
      width: screenSizeWidth,
      color: purpleNeutral,
      child: Container(
        padding: const EdgeInsets.only(left: 30.0),
        alignment: Alignment.centerLeft,
        child: const Text(
          "Copyright © 2023 - 2024 - Tous droits réservés",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  _getFooterTopItem({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 45,
        ),
        const SizedBox(width: 15),
        RichText(
            text: TextSpan(
                style: GoogleFonts.dmSans(color: Colors.white),
                children: [
              TextSpan(
                  text: "$title\n",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              TextSpan(text: content)
            ]))
      ],
    );
  }

  _getDivider() {
    return const SizedBox(height: 80, child: VerticalDivider());
  }

  Row _getSocialNetworkAndLogo() {
    return const Row(
      children: [
        Logo(
          paddingLeft: 0,
        ),
        SizedBox(
          width: 5,
        ),
        SocialMediaButtons(),
      ],
    );
  }

  Column _getColumnOfLink(linList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in linList)
          Text(
            item,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )
      ],
    );
  }
//---------
}

Map<String, List> footerLinks = {
  'column1': [
    'A propos',
    'Référencement',
    'Carièrres',
    'Actualités',
    'Blog',
    'Sécurisation Code Logiciels',
    'Audit de Vulnérabilité'
  ],
  'column2': [
    'Audit de Conformité',
    'Sécurisation Code Logiciels',
    'Développement Web',
    'Développement Logiciel'
  ],
  'column3': [
    'Cybersécurité',
    'Nos contrats de Maintenance',
    'Accompagnement Équipe',
  ]
};
