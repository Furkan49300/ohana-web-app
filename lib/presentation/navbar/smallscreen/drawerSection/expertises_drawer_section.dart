import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/smallscreen/drawerSection/custom_list_tile.dart';

class ExpertisesDrawerSection extends StatelessWidget {
  const ExpertisesDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(expertise);
              },
              icon: const Icon(Icons.arrow_forward)),
          Text(
            'Expertises',
            style: GoogleFonts.majorMonoDisplay(fontSize: 15),
          ),
        ],
      ),
      children: [
        ExpansionTile(
          title: Row(children: [
            const SizedBox(
                width: 150, child: Text('Services de développement')),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(devServices);
                },
                icon: const Icon(Icons.arrow_forward, size: 15)),
          ]),
          children: const [
            CustomListTile(title: "WEB", routeName: web),
            CustomListTile(title: "MOBILE"),
            CustomListTile(title: "LOGICIELS"),
            CustomListTile(title: "DESIGN"),
            CustomListTile(title: "REFERENCEMENT (SEO)"),
            CustomListTile(title: "IA GENERATIVE"),
          ],
        ),
        ExpansionTile(
          title: Row(children: [
            const SizedBox(
                width: 150, child: Text('Services de cybersécurité')),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("");
                },
                icon: const Icon(Icons.arrow_forward, size: 15)),
          ]),
          children: const [
            CustomListTile(title: "AUDIT DE SECURITE"),
            CustomListTile(title: "AUDIT DE VULNERABILITE"),
            CustomListTile(title: "AUDIT DE CONFORMITE"),
            CustomListTile(title: "PENTESTING"),
            CustomListTile(title: "ACCOMPAGNEMENT SUR MESURE"),
            CustomListTile(title: "SECURISATION CODE LOGICIEL"),
          ],
        )
      ],
    );
  }
}
