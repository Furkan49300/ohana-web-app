import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import "package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_bloc.dart";
import "package:ohana_webapp_flutter/presentation/pages/aboutUsPages/about_us_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/aboutUsPages/blogPage/blog_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/aboutUsPages/carreersPage/carreers_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/aboutUsPages/estimatePage/estimate_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/aboutUsPages/contactPage/contact_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/expertisesPages/DEV/MAINPAGE/dev_services_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/homePage/home_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/no_existing_page.dart";
import "package:ohana_webapp_flutter/presentation/constants/router_constants.dart";
import "package:ohana_webapp_flutter/presentation/pages/expertisesPages/MAINPAGE/services_largescreen_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/expertisesPages/DEV/webDevelopmentPage/web_service_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/offersPages/MAINPAGE/widgets/offers_page_largescreen.dart";

class AppRouter {
  final BlogPostBloc _blogPostBloc = BlogPostBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case root:
        return MaterialPageRoute(
            builder: (e) => BlocProvider.value(
                  value: _blogPostBloc,
                  child: const HomePage(),
                ));

      case contactUs:
        return MaterialPageRoute(builder: (e) => const ContactPage());

      case expertise:
        return MaterialPageRoute(
            builder: (e) => const ServicesPageLargeScreen());

      case web:
        return MaterialPageRoute(
            builder: (e) => const WebServicePageLargeScreen());

      case aboutUs:
        return MaterialPageRoute(builder: (e) => const AboutUsLargeScreen());

      case carreers:
        return MaterialPageRoute(
            builder: (e) => const CarreersPageLargeScreen());

      case blog:
        return MaterialPageRoute(
            builder: (e) => BlocProvider.value(
                  value: _blogPostBloc,
                  child: const BlogPageLargeScreen(),
                ));

      case offers:
        return MaterialPageRoute(builder: (e) => const OffersPageLargeScreen());

      case devServices:
        return MaterialPageRoute(
            builder: (e) => const DevServicesPageLargeScreen());

      case estimate:
        return MaterialPageRoute(
            builder: (e) => const EstimatePageLargeScreen());
      default:
        return MaterialPageRoute(builder: (e) => const NoExistingPage());
    }
  }

  void dispose() {
    _blogPostBloc.close();
  }
}
