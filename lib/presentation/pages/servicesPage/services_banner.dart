import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_text_content.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_underlined_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';

class ServicesBanner extends StatelessWidget {
  const ServicesBanner(
      {super.key,
      required this.text,
      this.boldTextList = const [''],
      required this.imagePath,
      this.message = '',
      required this.title,
      this.titleColor});
  final String text;
  final String title;
  final String message;
  final Color? titleColor;
  final String imagePath;
  final List<String> boldTextList;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        CustomBanner(
          message: message,
          textColor: titleColor,
          imagePath: imagePath,
        ),
        Positioned(
          bottom: -110,
          child: Container(
            padding: const EdgeInsets.only(
              left: spaceLeftBigTitle / 2,
              right: spaceLeftBigTitle / 2,
              top: 10,
            ),
            width: 990,
            height: 300,
            color: Colors.white,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: CustomUnderlineTitle(
                      title: title,
                      lineColor: Colors.purple,
                    )),
                const SizedBox(
                  height: 10,
                ),
                CustomTextContent(
                  text: text,
                  boldTextList: boldTextList,
                  boldListTextMode: true,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
