import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';

import 'package:ohana_webapp_flutter/presentation/navbar/smallscreen/drawerSection/custom_list_tile.dart';

class OffersDrawerSection extends StatelessWidget {
  const OffersDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(offers);
              },
              icon: const Icon(Icons.arrow_forward)),
          Text(
            'Offres',
            style: GoogleFonts.majorMonoDisplay(fontSize: 15),
          ),
        ],
      ),
      children: [
        ExpansionTile(
          title: Row(children: [
            const SizedBox(width: 150, child: Text('Nos offres')),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(offers);
                },
                icon: const Icon(Icons.arrow_forward, size: 15)),
          ]),
          children: const [
            CustomListTile(title: "PRODUITS SUR MESURE"),
            CustomListTile(title: "CONSEIL"),
            CustomListTile(title: "PRODUCTION DESIGN SPRINT"),
            CustomListTile(title: "CATALOGUE TARIFS"),
          ],
        ),
      ],
    );
  }
}
