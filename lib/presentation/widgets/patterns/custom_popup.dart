import 'package:flutter/material.dart';

import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_painter.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomPaint(
          size: const Size(50, 50),
          painter: CustomTrianglePainter(),
        ),
        Container(
          height: 130,
          width: 300,
          padding: const EdgeInsets.all(50),
          decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(partialCircularItem)),
          child: Center(
              child: Text(
            text, //---should be reviese
            maxLines: 3,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )),
        )
      ],
    );
  }
}
