import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:ohana_webapp_flutter/presentation/constants/default_values.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';

class JobOfferLargeScreenCard extends StatelessWidget {
  const JobOfferLargeScreenCard(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.keyWords,
      required this.date,
      this.alert,
      required this.onTap});
  final String title;
  final String imagePath;
  final String? alert;
  final DateTime date;
  final VoidCallback onTap;
  final List<String> keyWords;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [_getCard(screenWidth), _getButton()],
    );
    ;
  }

  _getCard(screenWidth) {
    const double widthBalence = 0.6;
    String dateFormatted = DateFormat("dd/MM/yyyy").format(date);
    return Container(
      height: 220,
      width: screenWidth * widthBalence,
      decoration: BoxDecoration(
          border: Border.all(width: 0.6),
          borderRadius: BorderRadius.circular(partialCircularItem)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(partialCircularItem),
                bottomLeft: Radius.circular(partialCircularItem)),
            child: Image.asset(
              imagePath != '' && imagePath != null
                  ? imagePath
                  : jobDefaultImage,
              height: 220,
              width: 170,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                softWrap: true,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 5,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 20, left: 0),
                      child: Wrap(spacing: 10, children: [
                        for (String item in keyWords)
                          if (item != '' && item != null)
                            Button(
                              item,
                              type: ButtonType.gray,
                              onTap: () {},
                              mouseCursor: MouseCursor.uncontrolled,
                            ),
                      ]))
                ],
              ),
              const SizedBox(height: 10),
              Text(
                dateFormatted,
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 10),
              _getAlertText(alert),
            ],
          ),
        ],
      ),
    );
  }

  Positioned _getButton() {
    return Positioned(
      right: 10,
      bottom: 10,
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
      ),
    );
  }

  _getAlertText(alert) {
    if (alert != null && alert != '') {
      return Row(
        children: [
          SvgPicture.asset(
            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
            'assets/alert_svg/alert-2-svgrepo-com.svg',
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 10),
          Text(
            alert ?? '',
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
