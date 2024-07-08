import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import "package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/paginated_blog_posts_bloc.dart";
import "package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/recent_blog_posts_bloc.dart";
import "package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/single_blog_post_bloc.dart";
import "package:ohana_webapp_flutter/presentation/bloc/job_offer/blocs/paginated_job_offer_bloc.dart";
import "package:ohana_webapp_flutter/presentation/bloc/job_offer/blocs/single_job_offer_bloc.dart";
import "package:ohana_webapp_flutter/presentation/pages/aboutUsPage/about_us.dart";
import "package:ohana_webapp_flutter/presentation/pages/blogPage/MAINPAGE/blog_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/blogPage/single_blogpost_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/carreersPage/MAINPAGE/carreers_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/carreersPage/applying/applying_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/carreersPage/single_carreer_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/developmentServicesPage/DEV/softwareDevelopmentPage/software_service_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/estimatePage/estimate_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/contactPage/contact_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/developmentServicesPage/dev_services_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/homePage/home_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/no_existing_page.dart";
import "package:ohana_webapp_flutter/presentation/constants/router_constants.dart";
import "package:ohana_webapp_flutter/presentation/pages/expertisesPage/expertises_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/developmentServicesPage/DEV/webDevelopmentPage/web_service_page.dart";
import "package:ohana_webapp_flutter/presentation/pages/offersPage/offers_page_largescreen.dart";
import "package:ohana_webapp_flutter/presentation/pages/searchPage/search_page.dart";

class AppRouter {
  final PaginatedBlogPostsBloc _paginatedBlogPostsBloc =
      PaginatedBlogPostsBloc();
  final RecentBlogPostsBloc _recentBlogPostsBloc = RecentBlogPostsBloc();
  final SingleBlogPostBloc _singleBlogPostsBloc = SingleBlogPostBloc();

  final PaginatedJobOfferBloc _jobOfferBloc = PaginatedJobOfferBloc();
  final SingleJobOfferBloc _singleJobOfferBloc = SingleJobOfferBloc();

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
        return MaterialPageRoute(builder: (e) => const ExpertisesPage());

      case web:
        return MaterialPageRoute(builder: (e) => WebServicePage());

//ABOUT US

      case aboutUs:
        return MaterialPageRoute(builder: (e) => AboutUsPage());

//CARREERS

      case carreers:
        return MaterialPageRoute(
            builder: (e) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: _jobOfferBloc),
                    BlocProvider.value(value: _singleJobOfferBloc),
                  ],
                  child: const CarreersPageLargeScreen(),
                ));

//SINGLE CARREER

      case singleCarreer:
        return MaterialPageRoute(
            builder: (e) => BlocProvider.value(
                  value: _singleJobOfferBloc,
                  child: const SingleCarreerPageLargeScreen(),
                ));

//POSTULATION

      case apply:
        return MaterialPageRoute(builder: (e) {
          final Map<String, dynamic>? arguments =
              routeSettings.arguments as Map<String, dynamic>?;

          // Extraire le titre de l'offre d'emploi des arguments
          final String jobOfferTitle =
              arguments != null ? arguments['jobOfferTitle'] : '';
          return ApplyingPage(
            jobOfferTitle: jobOfferTitle,
          );
        });

//BLOG

      case blog:
        return MaterialPageRoute(
            builder: (e) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: _paginatedBlogPostsBloc),
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
                  child: const SingleBlogPostPage(),
                ));

//OFFERS

      case offers:
        return MaterialPageRoute(builder: (e) => const OffersPageLargeScreen());

//QUOTE/ESTIMATE

      case estimate:
        return MaterialPageRoute(builder: (e) => const EstimatePage());

//SEARCH

      case search:
        return MaterialPageRoute(
          builder: (e) => SearchPageLargeScreen(),
        );

//DEV SERVICES

      case devServices:
        return MaterialPageRoute(builder: (e) => const DevelopmentServices());

//SOFTWARE SERVICES

      case softwares:
        return MaterialPageRoute(builder: (e) => SoftwareServicePage());

//NO EXISTING PAGE

      default:
        return MaterialPageRoute(builder: (e) => const NoExistingPage());
    }
  }

  void dispose() {
    _recentBlogPostsBloc.close();
    _singleBlogPostsBloc.close();
    _paginatedBlogPostsBloc.close();
    _jobOfferBloc.close();
    _singleJobOfferBloc.close();
  }
}
