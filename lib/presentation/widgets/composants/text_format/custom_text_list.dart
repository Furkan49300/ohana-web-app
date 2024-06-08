import 'package:flutter/material.dart';

class CustomListText extends StatelessWidget {
  final List<String> textList;
  final Color? textColor;
  final double? fontSize;
  final double? width;

  const CustomListText(
      {super.key,
      required this.textList,
      this.textColor,
      this.fontSize,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: textList
            .map((item) => BulletPoint(
                  text: item,
                  textColor: textColor,
                  fontSize: fontSize,
                  width: width,
                ))
            .toList());
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  final Color? textColor;
  final IconData? icon;
  final double? fontSize;
  final double? width;
  const BulletPoint(
      {super.key,
      required this.text,
      this.textColor,
      this.fontSize,
      this.width,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon ?? Icons.brightness_1,
              size: 10.0, color: textColor), // Cette icône sert de puce
          /*Text("• ",
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
              )),*/
          const SizedBox(width: 20),
          SizedBox(
              width: width,
              child: Text(text,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                  ))),
        ],
      ),
    );
  }
}
