import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_carousel.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnersCarousel extends StatelessWidget {
  const PartnersCarousel({super.key, this.title = ''});
  final String title;

  @override
  Widget build(BuildContext context) {
    List<Map> partnersLogoImage = [
      {
        'imagePath': 'assets/logo_partners/Angers_loire_metropole.jpeg',
        'title': 'Angers Loire Metropole',
        'url': "https://www.angersloiremetropole.fr/",
      },
      {
        'imagePath': 'assets/logo_partners/Hello-Https-Logo-Digitiz-1.png',
        'title': 'Hello https',
        'url': 'https://hello-https.fr/'
      },
      {
        'imagePath': 'assets/logo_partners/ohana_store.png',
        'title': 'OHana Store',
        'url': 'https://ohanastore.fr/'
      },
      {
        'imagePath': 'assets/logo_partners/KwimpaStore.jpeg',
        'title': 'KwimpaStore',
        'url': 'https://kwimpastore.fr/'
      },
      {
        'imagePath': 'assets/logo_partners/esaip.png',
        'title': 'Esaip',
        'url': ' https://www.esaip.org/'
      },
      {
        'imagePath': 'assets/logo_partners/anssi.png',
        'title': 'ANSSI Guinee',
        'url': 'https://anssi.gov.gn/'
      },
      {
        'imagePath': 'assets/logo_partners/clean_prop_solution.jpeg',
        'title': 'Clean Propres Solutions ',
        'url': 'https://clean-propres-solutions.com/'
      },
      {
        'imagePath': 'assets/logo_partners/ohana_it.png',
        'title': 'OHANA IT Guinée',
        'url': 'https://clean-propres-solutions.com/'
      },
      {
        'imagePath': 'assets/logo_partners/aylan_it.png',
        'title': 'Aylan IT',
        'url': 'https://www.aylanit.fr/'
      },
    ];
    return CustomCarousel(
      title: title,
      widgets: partnersLogoImage
          .map((company) => GestureDetector(
                onTap: () async {
                  String url = company['url'];
                  final Uri uri = Uri.parse(url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    throw 'Impossible d\'ouvrir le lien $url';
                  }
                },
                child: MouseRegion(
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
                            company['imagePath'],
                            width: 200,
                            height: 200,
                          ),
                        ),
                        Text(
                          company['title'],
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
