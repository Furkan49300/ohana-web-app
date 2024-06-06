import 'package:flutter/cupertino.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/bold_text_customiser.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';

class CustomTextWrapWithTitle extends StatelessWidget {
  const CustomTextWrapWithTitle(
      {super.key,
      required this.title,
      this.boldTextList = const [''],
      required this.text});
  final String title;
  final String text;
  final List<String> boldTextList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: spaceLeftBigTitle),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomUnderlineTitle(
            title: title,
          ),
          const SizedBox(
            height: 30,
          ),
          BoldTextCustomizer(
            text: text,
            boldTextList: boldTextList,
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
