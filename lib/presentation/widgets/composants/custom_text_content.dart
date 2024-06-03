import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextContent extends StatelessWidget {
  final String text;
  final List<String> boldTextList;
  final double boldFontSizeVal;
  final bool isOverflowEllipsis;
  final Color boldTextListColor;
  final int? maxLines;
  final bool boldListTextMode;

  const CustomTextContent(
      {super.key,
      required this.text,
      required this.boldTextList,
      this.boldFontSizeVal = 20,
      this.isOverflowEllipsis = false,
      this.maxLines,
      this.boldListTextMode = false,
      this.boldTextListColor = Colors.black});

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

  RichText getRichTextFromFormattedText(String formattedText) {
    return RichText(
      softWrap: true,
      maxLines: maxLines,
      overflow: isOverflowEllipsis ? TextOverflow.ellipsis : TextOverflow.clip,
      text: TextSpan(
        style: GoogleFonts.titilliumWeb(fontSize: 15.0),
        children: getTextSpanListFromText(formattedText),
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
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: boldFontSizeVal,
              color: boldTextListColor),
        );
        textSpanList.add(boldText);
      } else {
        var normalText = TextSpan(
          text: textList[i],
          style: TextStyle(
            fontSize: boldFontSizeVal,
          ),
        );
        textSpanList.add(normalText);
      }
    }
    return textSpanList;
  }
}
