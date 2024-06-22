import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ohana_webapp_flutter/presentation/footer/body/footer_large_screen.dart';
import 'package:ohana_webapp_flutter/presentation/footer/body/footer_small_screen.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1184) {
        return FooterLargeScreen(
          screenSize: screenSize,
        );
      } else {
        return const FooterSmallScreen();
      }
    });
  }
//---------
}
