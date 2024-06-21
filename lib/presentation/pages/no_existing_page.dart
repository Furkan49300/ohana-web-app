import 'package:flutter/material.dart';

import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/pages/homePage/home_page.dart';

class NoExistingPage extends StatelessWidget {
  const NoExistingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Expanded(
        child: SizedBox(
          width: screenSize.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/alert_images/1_7KCpGW9_D2rIlNV2JhFspQ.webp',
                fit: BoxFit.cover,
                width: screenSize.width,
                height: screenSize.height,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Page Introuvable",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Sorry, the page you are looking for does not exist.",
                    style: TextStyle(fontSize: 16),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(root);
                    },
                    child: const Text('Retour à la page d\'accueil'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
