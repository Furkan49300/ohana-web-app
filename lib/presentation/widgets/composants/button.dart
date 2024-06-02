import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';

class Button extends StatefulWidget {
  final String content;
  final ButtonType type;
  final double fontSizeVal;
  final VoidCallback onTap;
  final double paddingLeftRight;
  final double paddingTopBottom;

  const Button(
    this.content, {
    super.key,
    required this.type,
    required this.onTap,
    this.fontSizeVal = 17,
    this.paddingLeftRight = 20.0,
    this.paddingTopBottom = 5.0,
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (val) {
        setState(() {
          _isHover = val;
        });
      },
      child: Container(
        padding: EdgeInsets.only(
          left: widget.paddingLeftRight,
          top: widget.paddingTopBottom,
          right: widget.paddingLeftRight,
          bottom: widget.paddingTopBottom,
        ),
        decoration: BoxDecoration(
            color: _isHover ? widget.type.hoverColor : widget.type.primaryColor,
            border: _isHover ? getBorderOnNavbarButton(widget.type) : null),
        child: Text(
          widget.content,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: widget.type.textColor,
              fontSize: widget.fontSizeVal),
        ),
      ),
    );
  }
}

Border? getBorderOnNavbarButton(ButtonType type) {
  return type.isNavbarButton()
      ? const Border(bottom: BorderSide(color: Color(0xff7b327c), width: 6.0))
      : null;
}

enum ButtonType {
  navbar(
      primaryColor: Colors.transparent,
      hoverColor: Colors.white,
      textColor: Colors.black),
  standard(
      primaryColor: purpleNeutral,
      hoverColor: Color(0xffE384FF),
      textColor: Colors.white),
  paging(
      primaryColor: Color(0xffD9D9D9),
      hoverColor: Color(0xffD9D9D9),
      textColor: Colors.black);

  final Color? primaryColor;
  final Color? hoverColor;
  final Color? textColor;
  const ButtonType({this.primaryColor, this.hoverColor, this.textColor});

  bool isNavbarButton() {
    return this == ButtonType.navbar;
  }
}
