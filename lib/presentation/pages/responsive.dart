import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';

class Responsive {
  static isSmallBreakpointReached(BuildContext context) {
    return MediaQuery.of(context).size.width > smallBreakpoint;
  }

  static getScreenSizeWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
