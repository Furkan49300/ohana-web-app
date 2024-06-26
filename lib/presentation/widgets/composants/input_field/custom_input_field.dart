import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField(
      {super.key,
      required this.placeholder,
      this.widthBalance = 2 / 3,
      required this.textEditingController,
      this.fillColor = const Color(0xFFF0F2F2),
      this.textColors = Colors.black});

  final String placeholder;
  final double widthBalance;
  final Color fillColor;
  final Color textColors;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenSizeWidth * widthBalance,
      child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: const TextStyle(color: Colors.grey),
              border: InputBorder.none,
              filled: true,
              fillColor: fillColor,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: purpleNeutral),
              )),
          style: TextStyle(color: textColors)),
    );
  }
}
