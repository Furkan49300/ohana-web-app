import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfosPannel extends StatelessWidget {
  const InfosPannel(
      {super.key,
      required this.svgLink,
      required this.title,
      required this.text,
      this.textWidth = 200,
      this.svgSize = 50});
  final String svgLink;
  final String title;
  final String text;
  final double svgSize;
  final double textWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: textWidth,
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            svgLink,
            height: svgSize,
            width: svgSize,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
