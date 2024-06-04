import "package:flutter/material.dart";

import "package:ohana_webapp_flutter/presentation/pages/contactPage/contact_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/homePage/home_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/no_existing_page.dart";
import "package:ohana_webapp_flutter/presentation/constants/router_constants.dart";
import "package:ohana_webapp_flutter/presentation/pages/servicesPage/body/services_largescreen_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/servicesPage/body/web/web_service_largescreen_page.dart";

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case root:
        return MaterialPageRoute(builder: (e) => const HomePage());
      case contactUs:
        return MaterialPageRoute(builder: (e) => const ContactPage());
      case expertise:
        return MaterialPageRoute(
            builder: (e) => const ServicesPageLargeScreen());

      case web:
        return MaterialPageRoute(
            builder: (e) => const WebServicePageLargeScreen());

      default:
        return MaterialPageRoute(builder: (e) => const NoExistingPage());
    }
  }
}
