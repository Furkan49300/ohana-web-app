import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ohana_webapp_flutter/presentation/pages/aboutUsPages/carreersPage/widget/job_offer_largescreen_card.dart';
import 'package:ohana_webapp_flutter/presentation/pages/aboutUsPages/carreersPage/widget/job_offer_small_screen_card.dart';

class CustomJobOfferCard extends StatelessWidget {
  const CustomJobOfferCard({
    super.key,
    required this.id,
    required this.title,
    required this.imagePath,
    required this.date,
    this.alert,
    required this.keyWords,
    required this.onTap,
  });
  final String id;
  final String title;
  final String imagePath;
  final DateTime date;

  final VoidCallback onTap;
  final String? alert;
  final List<String> keyWords;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1184) {
        return Padding(
            padding: const EdgeInsets.all(20),
            child: JobOfferLargeScreenCard(
              title: title,
              imagePath: imagePath,
              keyWords: keyWords,
              date: date,
              alert: alert,
              onTap: onTap,
            ));
      } else {
        return JobOfferSmallScreenCard(
            imagePath: imagePath, title: title, keywords: keyWords);
      }
    });
  }
}
