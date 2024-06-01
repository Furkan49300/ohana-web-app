import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';

class DropdownMenuExpertises extends StatelessWidget {
  const DropdownMenuExpertises({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;
    return Container(
        height: 300,
        color: purpleNeutral,
        child: Row(
          children: [
            // header section
            Container(
              width: screenSizeWidth / 3,
              child: Column(
                children: [
                  Text("Expertises", style: ,),
                  Text(
                      "Découvre l'ensemble de nos services conçus pour répondre à vos besoins technologiques et de sécurité")
                ],
              ),
            ),
            // 1st section
            Container(
              width: screenSizeWidth / 3,
            ),
            // 2nd section
            Container(
              width: screenSizeWidth / 3,
            )
          ],
        ));
  }
}
