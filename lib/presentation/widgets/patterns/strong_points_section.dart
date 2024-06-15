import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_text_list.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';

class StrongPointsSection extends StatelessWidget {
  const StrongPointsSection(
      {super.key, this.height = 400, this.width = 400, this.textWidget});
  final double height;
  final double width;
  final Widget? textWidget;

  @override
  Widget build(BuildContext context) {
    List<String> defaultTextContent = [
      'Choississez un accompagnement personnalisé',
      'Une combinaison entre expertise et rigueur',
      'Un service de qualité',
      'Un accueil chaleureux'
    ];
    Size screenSize = MediaQuery.of(context).size;
    double widthBalance = 0.3;
    double height = 412;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, //begin at Start
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomUnderlineTitle(
            title: 'Les + de OHana Entreprise',
          ),
          const SizedBox(
            height: spaceBetweenBigTitleAndTextBody,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'buisness.jpg',
                height: height,
                width: screenSize.width * widthBalance,
                fit: BoxFit.cover,
              ),
              textWidget ??
                  Container(
                    height: height,
                    color: Colors.purple,
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomListText(
                        width: screenSize.width * widthBalance - 0.1,
                        textList: defaultTextContent,
                        textColor: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
            ],
          ),
        ]);
  }
}
