import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/footer/widget/footer_tools.dart';

class FooterSmallScreen extends StatefulWidget {
  const FooterSmallScreen({super.key});

  @override
  State<FooterSmallScreen> createState() => _FooterSmallScreenState();
}

class _FooterSmallScreenState extends State<FooterSmallScreen> {
  // Variables d'état pour chaque ExpansionTile
  bool isDevelopmentExpanded = false;
  bool isCybersecurityExpanded = false;
  bool isOffersExpanded = false;
  bool isKnowUsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getFooterTopSectionSmallScreen(),
        _getFooterMiddleSectionSmallScreen(),
        getFooterBottomSection(context),
      ],
    );
  }

  Container _getFooterTopSectionSmallScreen() {
    return Container(
      color: purpleNeutral,
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: getFooterTopItem(
                    size: 30,
                    icon: Icons.place,
                    title: "ADRESSE",
                    content: "15 Rue des Peupliers,\n49000 Angers, France"),
              ),
              getDivider(height: 40),
              Expanded(
                child: getFooterTopItem(
                    size: 30,
                    icon: Icons.phone,
                    title: "TELEPHONE",
                    content: "+337 07 77 77 77"),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: getFooterTopItem(
                    icon: Icons.email,
                    title: "EMAIL",
                    content: "ohana@entreprise.com",
                    size: 30),
              ),
              getDivider(height: 40),
              Expanded(
                child: getFooterTopItem(
                    size: 30,
                    icon: Icons.access_time,
                    title: "HORAIRES",
                    content: "Du Lundi au Vendredi,\n9h - 17h"),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Container _getFooterMiddleSectionSmallScreen() {
    double fontSize = 19;
    return Container(
      color: purpleLight,
      padding: const EdgeInsets.all(8.0),
      height: 210,
      child: ListView(
        children: [
          SizedBox(
            child: ExpansionTile(
              title: Text(
                "DEVELOPPEMENT",
                style: TextStyle(fontSize: fontSize, color: Colors.white),
              ),
              trailing: Icon(
                isDevelopmentExpanded ? Icons.remove : Icons.add,
                color: Colors.white,
              ),
              children: [
                _getFooterLink(text: 'Web', routeName: web),
                _getFooterLink(text: "Mobile"),
                _getFooterLink(text: "Logiciels"),
                _getFooterLink(text: "Design"),
                _getFooterLink(text: "Referencement (SEO)"),
                _getFooterLink(text: "IA generative"),
              ],
              onExpansionChanged: (value) {
                setState(() {
                  isDevelopmentExpanded = value;
                });
              },
            ),
          ),
          SizedBox(
            child: ExpansionTile(
              title: Text(
                "CYBERSECURITE",
                style: TextStyle(fontSize: fontSize, color: Colors.white),
              ),
              trailing: Icon(
                isCybersecurityExpanded ? Icons.remove : Icons.add,
                color: Colors.white,
              ),
              children: [
                _getFooterLink(text: "Audit de sécurité"),
                _getFooterLink(text: "Audit de vulnérabilité"),
                _getFooterLink(text: "Audit de conformité"),
                _getFooterLink(text: "Pentesting"),
                _getFooterLink(text: "Accompagnement sur mesure"),
                _getFooterLink(text: "Sécurisation de code logiciels"),
              ],
              onExpansionChanged: (value) {
                setState(() {
                  isCybersecurityExpanded = value;
                });
              },
            ),
          ),
          SizedBox(
            child: ExpansionTile(
              title: Text(
                "OFFRES",
                style: TextStyle(fontSize: fontSize, color: Colors.white),
              ),
              trailing: Icon(
                isOffersExpanded ? Icons.remove : Icons.add,
                color: Colors.white,
              ),
              children: [
                _getFooterLink(text: "Produits sur mesure"),
                _getFooterLink(text: "Conseil"),
                _getFooterLink(text: "Production design sprint"),
                _getFooterLink(text: "Catalogue tarifs"),
              ],
              onExpansionChanged: (value) {
                setState(() {
                  isOffersExpanded = value;
                });
              },
            ),
          ),
          SizedBox(
            child: ExpansionTile(
              title: Text(
                "NOUS CONNAITRE",
                style: TextStyle(fontSize: fontSize, color: Colors.white),
              ),
              trailing: Icon(
                isKnowUsExpanded ? Icons.remove : Icons.add,
                color: Colors.white,
              ),
              children: [
                _getFooterLink(text: "OHana Entreprise"),
                _getFooterLink(text: "Blog"),
                _getFooterLink(text: "Offres d'emploi"),
                _getFooterLink(text: "Devis", routeName: estimate),
                _getFooterLink(text: "Contactez-nous !"),
              ],
              onExpansionChanged: (value) {
                setState(() {
                  isKnowUsExpanded = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  _getFooterLink({required String text, String routeName = ''}) {
    return Row(
      children: [
        const SizedBox(width: 20),
        FooterLink(
          text: text,
          routeName: routeName,
        ),
      ],
    );
  }
}
