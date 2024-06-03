import 'package:flutter/material.dart';

import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/logo.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/social_media_buttons.dart';

class FooterLargeScreen extends StatelessWidget {
  const FooterLargeScreen({super.key, required this.mediaScreenWidth});
  final mediaScreenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      width: mediaScreenWidth,
      height: 350,
      child: Padding(
        padding: const EdgeInsets.only(left: spaceLeftBigTitle),
        child: Column(
          children: [
            _getSocialNetworkAndLogo(),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
    );
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
