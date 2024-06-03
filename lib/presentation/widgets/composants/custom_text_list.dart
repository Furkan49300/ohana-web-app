import 'package:flutter/material.dart';

class CustomListText extends StatelessWidget {
  final List<String> textList;
  final Color? textColor;
  final double? fontSize;

  const CustomListText({
    super.key,
    required this.textList,
    this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: _getSetOfTextListItem(textList, textColor, fontSize));
  }
}

List<Container> _getSetOfTextListItem(
    List<String> textList, Color? textColor, double? fontSize) {
  List<Container> result = [];
  for (var item in textList) {
    result.add(Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.brightness_1,
                size: 6.0, color: textColor), // Cette icône sert de puce
          ),
          Text(
            item,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ],
      ),
    ));
  }
  return result;
}
