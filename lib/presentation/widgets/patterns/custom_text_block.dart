import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/pages/responsive.dart';
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
    this.crossAxisAlignment = WrapCrossAlignment.center,
  });
  final TextDirection? textDirection;
  final String image;
  final String title;
  final String text;
  final WrapCrossAlignment crossAxisAlignment;
  final List<String> boldList;
  final List<String> textBulletList;

  @override
  Widget build(BuildContext context) {
    final double screenSizeWidth = Responsive.getScreenSizeWidth(context);
    double textWidth = screenSizeWidth * 0.45;
    return Container(
      padding: const EdgeInsets.only(
        bottom: 50,
        left: spaceBetweenBigTitleAndTextBody,
      ),
      child: (screenSizeWidth > smallBreakpoint)
          ? _rowLayout(textWidth)
          : _columnLayout(textWidth),
    );
  }

  _rowLayout(textWidth) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      textDirection: textDirection,
      children: [_imageSection(), _contentSection(textWidth)],
    );
  }

  _columnLayout(textWidth) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      textDirection: textDirection,
      children: [_imageSection(), _contentSection(textWidth)],
    );
  }

  _imageSection() {
    return Flexible(
      flex: 3,
      child: Padding(
        padding:
            EdgeInsets.only(left: 15, right: textDirection != null ? 40 : 0),
        child: Image.asset(
          image,
          width: 700,
          height: 500,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _contentSection(textWidth) {
    return Flexible(
      flex: 4,
      child: Padding(
        padding:
            EdgeInsets.only(left: 15, right: textDirection != null ? 0 : 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: textBigTitleFontSize, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (text != '')
              BoldTextCustomizer(
                  width: textWidth, text: text, boldTextList: boldList),
            if (textBulletList != const [''])
              SizedBox(
                width: 700,
                child: CustomListText(
                  fontSize: 20,
                  textList: textBulletList,
                ),
              )
          ],
        ),
      ),
    );
  }
}

// 
// 