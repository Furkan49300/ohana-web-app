import 'package:flutter/material.dart';

class TextCheckCase extends StatefulWidget {
  const TextCheckCase(
      {super.key, this.widthBalance = 1 / 2.1, required this.text});
  final double widthBalance;
  final String text;

  @override
  State<TextCheckCase> createState() => _TextCheckCaseState();
}

class _TextCheckCaseState extends State<TextCheckCase> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    double mediaScreenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
          checkColor: Colors.white,
          fillColor: MaterialStateColor.resolveWith(
              (states) => _isChecked ? Colors.purple : Colors.white),
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
