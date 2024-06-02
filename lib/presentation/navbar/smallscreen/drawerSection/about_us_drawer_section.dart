import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/smallscreen/drawerSection/custom_list_tile.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/social_media_buttons.dart';

class AboutUsDrawerSection extends StatelessWidget {
  const AboutUsDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("");
              },
              icon: const Icon(Icons.arrow_forward)),
          Text(
            'Nous connaître',
            style: GoogleFonts.majorMonoDisplay(fontSize: 15),
          ),
        ],
      ),
      children: [
        ExpansionTile(
          title: Row(children: [
            const SizedBox(width: 150, child: Text('OHana Entreprise')),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("");
                },
                icon: const Icon(Icons.arrow_forward, size: 15)),
          ]),
          children: const [
            CustomListTile(title: "NOTRE HISTOIRE"),
            CustomListTile(title: "PROJETS REALISES"),
            CustomListTile(title: "NOTRE EQUIPE"),
            CustomListTile(title: "OU SOMMES-NOUS ?"),
          ],
        ),
        ExpansionTile(
          title: Row(children: [
            const SizedBox(width: 150, child: Text('Clients')),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("");
                },
                icon: const Icon(Icons.arrow_forward, size: 15)),
          ]),
          children: const [
            CustomListTile(title: "NOS PARTENAIRES"),
            CustomListTile(title: "DEVIS"),
            CustomListTile(
              title: "CONTACTEZ-NOUS !",
              routeName: contactUs,
            ),
          ],
        ),
        ExpansionTile(
          title: Row(children: [
            const SizedBox(width: 150, child: Text('Carrières et Blogs')),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("");
                },
                icon: const Icon(Icons.arrow_forward, size: 15)),
          ]),
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: SocialMediaButtons(
                primaryColor: Colors.black,
                hoverDisabled: true,
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            ),
            CustomListTile(title: "BLOG"),
            CustomListTile(title: "OFFRES D'EMPLOI"),
            CustomListTile(title: "ESPACE CANDIDAT"),
          ],
        )
      ],
    );
  }
}
