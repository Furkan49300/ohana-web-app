import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/pages/responsive.dart';
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
      'Une maîtrise des technologies les plus récentes',
      'Une combinaison entre expertise et rigueur',
      'Un service de qualité',
      'Une collaboration étroite avec les clients pour des retours et ajustements en temps réel',
      'Un accueil chaleureux',
    ];
    double screenSizeWidth = Responsive.getScreenSizeWidth(context);
    double textFontSize =
        Responsive.isSmallBreakpointReached(context) ? 20 : 17;
    double sectionHeight = Responsive.isSmallBreakpointReached(context)
        ? 450
        : Responsive.getScreenSizeWidth(context) / 2;

    return (screenSizeWidth > smallBreakpoint)
        ? _rowLayout(sectionHeight, defaultTextContent, textFontSize)
        : _columnLayout(defaultTextContent, textFontSize, screenSizeWidth);
  }

  _rowLayout(double sectionHeight, List<String> defaultTextContent,
      double textFontSize) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _imageSection(sectionHeight),
          _contentSection(sectionHeight, defaultTextContent, textFontSize)
        ]);
  }

  _columnLayout(
      List<String> defaultTextContent, double textFontSize, double imageWidth) {
    return SizedBox(
      height: 950,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imageSection(400, imageWidth: imageWidth),
          _contentSection(400, defaultTextContent, textFontSize)
        ],
      ),
    );
  }

  _imageSection(double sectionHeight, {double? imageWidth}) {
    return Flexible(
      flex: 1,
      child: Image.asset(
        'assets/buisness.jpg', // Adjust path according to your project
        height: sectionHeight,
        width: imageWidth,
        fit: BoxFit.cover,
      ),
    );
  }

  _contentSection(double sectionHeight, List<String> defaultTextContent,
      double textFontSize) {
    return Flexible(
      flex: 1,
      child: Container(
        color: Colors.purple,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        height: sectionHeight,
        child: textWidget ??
            CustomListText(
                textList: defaultTextContent,
                textColor: Colors.white,
                fontSize: textFontSize),
      ),
    );
  }
}
