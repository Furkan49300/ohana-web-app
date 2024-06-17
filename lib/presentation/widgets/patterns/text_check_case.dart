import 'package:flutter/material.dart';

class TextCheckCase extends StatefulWidget {
  TextCheckCase({super.key, this.widthBalance = 1 / 2.1, required this.text});
  final double widthBalance;
  final String text;
  bool isChecked = false;

  @override
  State<TextCheckCase> createState() => TextCheckCaseState();
}

class TextCheckCaseState extends State<TextCheckCase> {
  bool get isChecked => widget.isChecked;

  @override
  Widget build(BuildContext context) {
    double mediaScreenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: widget.isChecked,
          onChanged: (value) {
            setState(() {
              widget.isChecked = value ?? false;
            });
          },
          checkColor: Colors.white,
          fillColor: MaterialStateColor.resolveWith(
              (states) => widget.isChecked ? Colors.purple : Colors.white),
        ),
        SizedBox(
          width: mediaScreenWidth * widget.widthBalance,
          child: Text(
            widget.text,
            style: const TextStyle(fontSize: 15),
          ),
        )
      ],
    );
  }
}
