import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/bold_text_customiser.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_text_list.dart';

class CustomTextBlock extends StatelessWidget {
  const CustomTextBlock({
    super.key,
    this.textDirection,
    required this.image,
    this.title = '',
    this.text = '',
    this.boldList = const [''],
    this.textBulletList = const [''],
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });
  final TextDirection? textDirection;
  final String image;
  final String title;
  final String text;
  final CrossAxisAlignment crossAxisAlignment;
  final List<String> boldList;
  final List<String> textBulletList;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    double textWidth = screenSize.width * 0.45;
    return Container(
        padding: const EdgeInsets.only(
          bottom: 50,
          left: spaceBetweenBigTitleAndTextBody,
        ),
        child: Row(
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              width: 700,
              height: 500,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10, right: textDirection != null ? 40 : 0),
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: textBigTitleFontSize,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (text != '')
                      BoldTextCustomizer(
                          width: textWidth, text: text, boldTextList: boldList),
                    if (textBulletList != [''])
                      CustomListText(
                          width: textWidth,
                          fontSize: 20,
                          textList: textBulletList)
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

// 
// 