import 'package:flutter/material.dart';

class CustomTextarea extends StatelessWidget {
  final String placeholder;
  final double widthBalance;
  final TextEditingController textEditingController;
  const CustomTextarea(
      {super.key,
      this.placeholder = "",
      this.widthBalance = 1 / 2,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenSizeWidth * widthBalance,
      child: TextField(
        maxLines: 7,
        decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
            filled: true,
            fillColor: const Color(0xFFF0F2F2),
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 117, 33, 243)))),
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }
}
