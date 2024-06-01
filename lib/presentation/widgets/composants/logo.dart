import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double heightLogo;
  final double paddingLeft;
  const Logo({super.key, this.heightLogo = 150, this.paddingLeft = 45});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft, top: 5, bottom: 5),
      child: Image.asset(
        'assets/logo.png',
        width: heightLogo,
        fit: BoxFit.cover,
      ),
    );
  }
}
