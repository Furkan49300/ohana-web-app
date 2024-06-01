import 'package:flutter/material.dart';

import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/pages/homePage/body/home_page_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/pages/homePage/body/home_page_smallscreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < smallBreakpoint) {
        return const HomePageSmallScreen();
      } else {
        return const HomePageLargeScreen();
      }
    });
  }
}
