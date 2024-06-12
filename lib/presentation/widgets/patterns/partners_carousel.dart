import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_carousel.dart';

class PartnersCarousel extends StatelessWidget {
  const PartnersCarousel({super.key, this.title = ''});
  final String title;

  @override
  Widget build(BuildContext context) {
    List<Map> partnersLogoImage = [
      {
        'imagePath': 'assets/logo_partners/Angers_loire_metropole.jpeg',
        'title': 'Angers Loire Metropole'
      },
      {
        'imagePath': 'assets/logo_partners/Hello-Https-Logo-Digitiz-1.png',
        'title': 'Hello https'
      },
      {
        'imagePath': 'assets/logo_partners/ohana_store.webp',
        'title': 'Ohana Store'
      },
      {
        'imagePath': 'assets/logo_partners/KwimpaStore.jpeg',
        'title': 'KwimpaStore'
      },
      {'imagePath': 'assets/logo_partners/esaip.png', 'title': 'Esaip'},
      {'imagePath': 'assets/logo_partners/anssi.png', 'title': 'ANSSI Guinee'},
      {
        'imagePath': 'assets/logo_partners/clean_prop_solution.jpeg',
        'title': 'Clean Propres Solutions '
      },
    ];
    return CustomCarousel(
      title: title,
      widgets: partnersLogoImage
          .map((enterprise) => MouseRegion(
                //To Do onTap
                cursor: SystemMouseCursors.click,
                child: SizedBox(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset(
                          enterprise['imagePath'],
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        enterprise['title'],
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
