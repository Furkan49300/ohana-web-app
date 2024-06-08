import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';

class CustomCarreerCard extends StatelessWidget {
  const CustomCarreerCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.date,
      this.alert,
      required this.keyWords,
      required this.onTap});
  final String imagePath;
  final String title;
  final String date;
  final Function onTap;
  final String? alert;
  final List<String> keyWords;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [_getCard(), _getButton()],
      ),
    );
  }

  _getCard() {
    return Container(
      width: 1000,
      decoration: BoxDecoration(
          border: Border.all(width: 0.6),
          borderRadius: BorderRadius.circular(partialCircularItem)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(partialCircularItem),
                bottomLeft: Radius.circular(partialCircularItem)),
            child: Image.asset(
              imagePath,
              height: 220,
              width: 170,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30), //space between image and title
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 20, left: 0),
                        child: Wrap(spacing: 10, children: [
                          for (var item in keyWords)
                            Button(
                              item,
                              type: ButtonType.gray,
                              onTap: () {},
                            ),
                        ]))
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  date,
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 10),
                if (alert != null)
                  Row(
                    children: [
                      SvgPicture.asset(
                        colorFilter:
                            const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                        'assets/alert_svg/alert-2-svgrepo-com.svg',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        alert ?? '',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      )
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

  _getButton() {
    return Positioned(
        right: 30,
        bottom: 30,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(partialCircularItem),
          child: Button(
            'Voir l\'offre',
            type: ButtonType.standard,
            paddingLeftRight: 15.0,
            paddingTopBottom: 15.0,
            onTap: () {
              onTap();
            },
          ),
        ));
  }
}
