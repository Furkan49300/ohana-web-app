import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextContent extends StatelessWidget {
  final String text;
  final List<String> boldTextList;
  final bool isOverflowEllipsis;
  final Color boldTextListColor;
  final int? maxLines;
  final double? fontSize;
  final bool boldListTextMode;
  final double? width;

  const CustomTextContent(
      {super.key,
      required this.text,
      required this.boldTextList,
      this.isOverflowEllipsis = false,
      this.maxLines,
      this.boldListTextMode = false,
      this.boldTextListColor = Colors.black,
      this.width,
      this.fontSize = 20.0});

  @override
  Widget build(BuildContext context) {
    String formattedText = formatText(
      text,
    );
    return getRichTextFromFormattedText(formattedText);
  }

  String formatText(
    String text,
  ) {
    String newContent = text;
    for (var i = 0; i < boldTextList.length; i++) {
      String boldWord = boldTextList[i];
      if (text.contains(boldWord)) {
        if (boldListTextMode) {
          newContent = newContent.replaceFirst(
            boldWord,
            '/$boldWord/',
          );
        } else {
          newContent = newContent.replaceAll(boldWord, '/$boldWord/');
        }
      }
    }
    return newContent;
  }

  SizedBox getRichTextFromFormattedText(String formattedText) {
    return SizedBox(
      width: width,
      child: RichText(
        softWrap: true,
        maxLines: maxLines,
        overflow:
            isOverflowEllipsis ? TextOverflow.ellipsis : TextOverflow.clip,
        text: TextSpan(
          style: GoogleFonts.dmSans(fontSize: fontSize),
          children: getTextSpanListFromText(formattedText),
        ),
      ),
    );
  }

  List<TextSpan> getTextSpanListFromText(String formattedText) {
    List<String> textList = formattedText.split('/');
    List<TextSpan> textSpanList = [];
    for (var i = 0; i < textList.length; i++) {
      if (boldTextList.contains(textList[i])) {
        var boldText = TextSpan(
          text: textList[i],
          style:
              TextStyle(fontWeight: FontWeight.bold, color: boldTextListColor),
        );
        textSpanList.add(boldText);
      } else {
        var normalText = TextSpan(
          text: textList[i],
        );
        textSpanList.add(normalText);
      }
    }
    return textSpanList;
  }
}
