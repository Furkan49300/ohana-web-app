import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navigation_bar_contents_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/smallscreen/custom_drawer.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/smallscreen/navigation_bar_contents_smallscreen.dart';

class NavbarResponsiveness {
  static PreferredSize getNavbar(screenSizeWidth, {bool isOnDetails = false}) {
    Color blackColorwhiteOpacity = Colors.black.withOpacity(0.5);
    ColorFilter colorFilter = ColorFilter.mode(
        isOnDetails ? blackColorwhiteOpacity : Colors.transparent,
        BlendMode.srcATop);

    return screenSizeWidth > smallBreakpoint
        ? PreferredSize(
            preferredSize: Size(screenSizeWidth, navBarHeight),
            //child: const NavigationBarContentsLargeScreen())
            child: ColorFiltered(
                colorFilter: colorFilter,
                child: const NavigationBarContentsLargeScreen()))
        : PreferredSize(
            preferredSize: Size(screenSizeWidth, navBarHeight),
            child: AppBar(
                automaticallyImplyLeading:
                    false, // This removes the back button
                actions: [Container()],
                flexibleSpace: ColorFiltered(
                    colorFilter: colorFilter,
                    child: const NavigationBarContentsSmallScreen())));
  }

  static getEndDrawer(screenSizeWidth) {
    return screenSizeWidth > smallBreakpoint ? null : const CustomEndDrawer();
  }
}
