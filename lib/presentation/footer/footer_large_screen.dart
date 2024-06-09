import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';

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
        _getFooterMiddleSection(),
        _getFooterBottomSection(screenSizeWidth)
      ],
    );
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

  _getFooterMiddleSection() {
    return Container(
      height: 300,
      color: purpleLight,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Logo(heightLogo: 200),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "DEVELOPPEMENT",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 10),
              FooterLink(text: "Web", routeName: web),
              FooterLink(text: "Mobile"),
              FooterLink(text: "Logiciels"),
              FooterLink(text: "Design"),
              FooterLink(text: "Referencement (SEO)"),
              FooterLink(text: "IA generative")
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "CYBERSECURITE",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 10),
              FooterLink(text: "Audit de sécurité"),
              FooterLink(text: "Audit de vulnérabilité"),
              FooterLink(text: "Audit de conformité"),
              FooterLink(text: "Pentesting"),
              FooterLink(text: "Accompagnement sur mesure"),
              FooterLink(text: "Sécurisation de code logiciels")
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OFFRES",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 10),
              FooterLink(text: "Produits sur mesure"),
              FooterLink(text: "Conseil"),
              FooterLink(text: "Production design sprint"),
              FooterLink(text: "Catalogue tarifs"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "NOUS CONNAITRE",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 10),
              SocialMediaButtons(),
              FooterLink(text: "OHana Entreprise"),
              FooterLink(text: "Blog"),
              FooterLink(text: "Offres d'emploi"),
              FooterLink(text: "Devis", routeName: estimate),
              FooterLink(text: "Contactez-nous !"),
            ],
          )
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

class FooterLink extends StatefulWidget {
  final String text;
  final String routeName;
  const FooterLink({super.key, required this.text, this.routeName = ""});

  @override
  State<FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<FooterLink> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(widget.routeName),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isHovered = false;
          });
        },
        child: Text(widget.text,
            style: TextStyle(
                fontSize: 15,
                color: _isHovered ? dropDownHoverColor : Colors.white)),
      ),
    );
  }
}
