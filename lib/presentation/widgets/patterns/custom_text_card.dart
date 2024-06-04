import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';

class CustomTextCard extends StatelessWidget {
  const CustomTextCard(
      {super.key,
      this.textDirection,
      required this.image,
      this.title = '',
      required this.widget});
  final TextDirection? textDirection;
  final String image;
  final Widget widget;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          bottom: 50,
          left: spaceBetweenBigTitleAndTextBody,
          right: spaceBetweenBigTitleAndTextBody),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            textDirection: textDirection,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      left: 40, right: textDirection != null ? 40 : 0),
                  child: widget),
            ],
          ),
        ],
      ),
    );
  }
}
