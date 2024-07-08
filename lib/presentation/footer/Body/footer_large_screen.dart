import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/footer/widget/footer_tools.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/logo.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/social_media_buttons.dart';

class FooterLargeScreen extends StatelessWidget {
  const FooterLargeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getFooterTopSectionLargeScreen(),
        _getFooterMiddleSectionLargeScreen(),
        getFooterBottomSection(context),
      ],
    );
  }

//LARGE SCREEN SECTION

  _getFooterTopSectionLargeScreen() {
    return Container(
      height: 130,
      color: purpleNeutral,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: getFooterTopItem(
                icon: Icons.place,
                title: "ADRESSE",
                content: "16 Rue du Maine 49100 Angers"),
          ),
          getDivider(),
          Expanded(
            child: getFooterTopItem(
                icon: Icons.phone,
                title: "TELEPHONE",
                content: "09 80 80 39 55"),
          ),
          getDivider(),
          Expanded(
            child: getFooterTopItem(
                icon: Icons.email,
                title: "EMAIL",
                content: "contact@ohanaentreprise.com"),
          ),
          getDivider(),
          Expanded(
            child: getFooterTopItem(
                icon: Icons.access_time,
                title: "HORAIRES",
                content: "Du Lundi au Vendredi,\n9h - 18h"),
          ),
        ],
      ),
    );
  }

  _getFooterMiddleSectionLargeScreen() {
    const double spaceBetweenTheTop = 30;
    const double minSpaceBetweenColumn = 30;
    return Container(
      height: 300,
      color: purpleLight,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Logo(heightLogo: 200),
          SizedBox(width: minSpaceBetweenColumn),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: spaceBetweenTheTop),
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
          ),
          SizedBox(width: minSpaceBetweenColumn),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: spaceBetweenTheTop),
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
          ),
          SizedBox(width: minSpaceBetweenColumn),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: spaceBetweenTheTop),
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
          ),
          SizedBox(width: minSpaceBetweenColumn),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: spaceBetweenTheTop),
                Text(
                  "NOUS CONNAITRE",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                SizedBox(height: 10),
                SocialMediaButtons(),
                FooterLink(text: "OHana Entreprise"),
                FooterLink(text: "Blog"),
                FooterLink(
                  text: "Offres d'emploi",
                  routeName: carreers,
                ),
                FooterLink(text: "Devis", routeName: estimate),
                FooterLink(text: "Contactez-nous !"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
