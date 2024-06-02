import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.placeholder,
  });

  final String placeholder;

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenSizeWidth * 2 / 3,
      child: TextField(
          decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: const TextStyle(color: Colors.grey),
              border: InputBorder.none,
              filled: true,
              fillColor: const Color(0xFFF0F2F2),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: purpleNeutral),
              )),
          style: const TextStyle(
            color: Colors.black,
          )),
    );
  }
}
