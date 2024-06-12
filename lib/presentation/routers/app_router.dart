import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import "package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/all_blog_posts_bloc.dart";
import "package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/recent_blog_posts_bloc.dart";
import "package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/single_blog_post_bloc.dart";
import "package:ohana_webapp_flutter/presentation/pages/aboutUsPages/about_us_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/aboutUsPages/blogPage/MAINPAGE/blog_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/aboutUsPages/blogPage/single_blogpost_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/aboutUsPages/carreersPage/MAINPAGE/carreers_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/aboutUsPages/carreersPage/single_carreer_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/aboutUsPages/estimatePage/estimate_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/aboutUsPages/contactPage/contact_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/expertisesPages/DEV/MAINPAGE/dev_services_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/homePage/home_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/no_existing_page.dart";
import "package:ohana_webapp_flutter/presentation/constants/router_constants.dart";
import "package:ohana_webapp_flutter/presentation/pages/expertisesPages/MAINPAGE/services_largescreen_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/expertisesPages/DEV/webDevelopmentPage/web_service_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/offersPages/MAINPAGE/widgets/offers_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/searchPage/search_page_largescreen.dart";

class AppRouter {
  final AllBlogPostsBloc _allBlogPostsBloc = AllBlogPostsBloc();
  final RecentBlogPostsBloc _recentBlogPostsBloc = RecentBlogPostsBloc();
  final SingleBlogPostBloc _singleBlogPostsBloc = SingleBlogPostBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case root:
//HOME
        return MaterialPageRoute(
            builder: (e) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: _recentBlogPostsBloc),
                    BlocProvider.value(value: _singleBlogPostsBloc),
                  ],
                  child: const HomePage(),
                ));

      case contactUs:
        return MaterialPageRoute(builder: (e) => const ContactPage());

//EXPERTISES

      case expertise:
        return MaterialPageRoute(
            builder: (e) => const ServicesPageLargeScreen());

      case web:
        return MaterialPageRoute(
            builder: (e) => const WebServicePageLargeScreen());

//ABOUT US

      case aboutUs:
        return MaterialPageRoute(builder: (e) => const AboutUsLargeScreen());

//CARREERS

      case carreers:
        return MaterialPageRoute(
            builder: (e) => const CarreersPageLargeScreen());

//SINGLE CARREER

      case singleCarreer:
        return MaterialPageRoute(
            builder: (e) => const SingleCarreerPageLargeScreen());

//BLOG

      case blog:
        return MaterialPageRoute(
            builder: (e) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: _allBlogPostsBloc),
                    BlocProvider.value(value: _recentBlogPostsBloc),
                    BlocProvider.value(value: _singleBlogPostsBloc),
                  ],
                  child: const BlogPageLargeScreen(),
                ));
//SINGLE BLOG VIEW

      case singleBlog:
        return MaterialPageRoute(
            builder: (e) => BlocProvider.value(
                  value: _singleBlogPostsBloc,
                  child: const SingleBlogPostPageLargeScreen(),
                ));

//OFFERS

      case offers:
        return MaterialPageRoute(builder: (e) => const OffersPageLargeScreen());

//DEV SERVICES

      case devServices:
        return MaterialPageRoute(
            builder: (e) => const DevServicesPageLargeScreen());

//QUOTE/ESTIMATE

      case estimate:
        return MaterialPageRoute(
            builder: (e) => const EstimatePageLargeScreen());

//SEARCH

      case search:
        return MaterialPageRoute(builder: (e) => const SearchPageLargeScreen());

      default:
        return MaterialPageRoute(builder: (e) => const NoExistingPage());
    }
  }

  void dispose() {
    _allBlogPostsBloc.close();
    _recentBlogPostsBloc.close();
    _singleBlogPostsBloc.close();
  }
}
