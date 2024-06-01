import "package:flutter/material.dart";

import "package:ohana_webapp_flutter/presentation/pages/contactPage/contact_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/homePage/home_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/no_existing_page.dart";
import "package:ohana_webapp_flutter/presentation/constants/router_constants.dart";

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case root:
        return MaterialPageRoute(builder: (e) => const HomePage());
      case contactUs:
        return MaterialPageRoute(builder: (e) => const ContactPage());
      default:
        return MaterialPageRoute(builder: (e) => const NoExistingPage());
    }
  }
}
