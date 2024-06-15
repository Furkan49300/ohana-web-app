import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/footer/widget/footer_tools.dart';

class FooterSmallScreen extends StatelessWidget {
  const FooterSmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        _getFooterTopSectionSmallScreen(),
        _getFooterMiddleSectionSmallScreen(),
        getFooterBottomSection(screenWidth)
      ],
    );
  }

  Container _getFooterTopSectionSmallScreen() {
    return Container(
      color: purpleNeutral,
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getFooterTopItem(
                  size: 30,
                  icon: Icons.place,
                  title: "ADRESSE",
                  content: "15 Rue des Peupliers,\n49000 Angers, France"),
              getDivider(height: 40),
              getFooterTopItem(
                  size: 30,
                  icon: Icons.phone,
                  title: "TELEPHONE",
                  content: "+337 07 77 77 77"),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getFooterTopItem(
                  icon: Icons.email,
                  title: "EMAIL",
                  content: "ohana@entreprise.com",
                  size: 30),
              getDivider(height: 40),
              getFooterTopItem(
                  size: 30,
                  icon: Icons.access_time,
                  title: "HORAIRES",
                  content: "Du Lundi au Vendredi,\n9h - 17h"),
            ],
          )
        ],
      ),
    );
  }

  Container _getFooterMiddleSectionSmallScreen() {
    return Container(
      color: purpleLight,
      padding: const EdgeInsets.all(8.0),
      height: 210,
      child: ListView(
        children: [
          SizedBox(
            child: ExpansionTile(
              title: const Text(
                "DEVELOPPEMENT",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              trailing: _getAddIcon(),
              children: [
                _getFooterLink(text: 'web', routeName: web),
                _getFooterLink(text: "Mobile"),
                _getFooterLink(text: "Logiciels"),
                _getFooterLink(text: "Design"),
                _getFooterLink(text: "Referencement (SEO)"),
                _getFooterLink(text: "IA generative")
              ],
            ),
          ),
          SizedBox(
            child: ExpansionTile(
              title: const Text(
                "CYBERSECURITE",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              trailing: _getAddIcon(),
              children: [
                _getFooterLink(text: "Audit de sécurité"),
                _getFooterLink(text: "Audit de vulnérabilité"),
                _getFooterLink(text: "Audit de conformité"),
                _getFooterLink(text: "Pentesting"),
                _getFooterLink(text: "Accompagnement sur mesure"),
                _getFooterLink(text: "Sécurisation de code logiciels")
              ],
            ),
          ),
          SizedBox(
            child: ExpansionTile(
                title: const Text(
                  "OFFRES",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                trailing: _getAddIcon(),
                children: [
                  _getFooterLink(text: "Produits sur mesure"),
                  _getFooterLink(text: "Conseil"),
                  _getFooterLink(text: "Production design sprint"),
                  _getFooterLink(text: "Catalogue tarifs"),
                ]),
          ),
          SizedBox(
            child: ExpansionTile(
                title: const Text(
                  "NOUS CONNAITRE",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                trailing: _getAddIcon(),
                children: [
                  _getFooterLink(text: "OHana Entreprise"),
                  _getFooterLink(text: "Blog"),
                  _getFooterLink(text: "Offres d'emploi"),
                  _getFooterLink(text: "Devis", routeName: estimate),
                  _getFooterLink(text: "Contactez-nous !"),
                ]),
          ),
        ],
      ),
    );
  }

  _getAddIcon() {
    return const Icon(Icons.add);
  }

  _getFooterLink({required String text, String routeName = ''}) {
    return Row(
      children: [
        const SizedBox(width: 20),
        FooterLink(
          text: text,
          routeName: routeName,
        )
      ],
    );
  }
}
