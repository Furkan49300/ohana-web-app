import 'package:flutter/material.dart';

class CustomUnderlineTitle extends StatelessWidget {
  const CustomUnderlineTitle(
      {super.key,
      required this.title,
      this.lineColor = Colors.purple,
      this.textWidth});
  final String title;
  final Color lineColor;
  final double? textWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: lineColor, width: 5))),
      child: SizedBox(
        width: textWidth,
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
        ),
      ),
    );
  }
}
