import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_text_list.dart';

class StrongPointsSection extends StatelessWidget {
  const StrongPointsSection({
    super.key,
    this.textWidget,
  });

  final Widget? textWidget;

  @override
  Widget build(BuildContext context) {
    List<String> defaultTextContent = [
      'Choississez un accompagnement personnalisé',
      'Une combinaison entre expertise et rigueur',
      'Un service de qualité',
      'Un accueil chaleureux',
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        double imageHeight =
            constraints.maxWidth > 600 ? 400 : constraints.maxWidth / 2;
        double textFontSize = constraints.maxWidth > 600 ? 20 : 16;
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Image.asset(
                  'assets/buisness.jpg', // Adjust path according to your project
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.purple,
                  height: imageHeight,
                  child: Align(
                    alignment: Alignment.center,
                    child: textWidget ??
                        CustomListText(
                            textList: defaultTextContent,
                            textColor: Colors.white,
                            fontSize: textFontSize),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
