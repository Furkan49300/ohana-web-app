import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/all_blog_posts_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/recent_blog_posts_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_state.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_large_screen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navigation_bar_contents_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/blog_card.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_smart_paginator.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/circular_text_overlay.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/blog_card_pattern.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_carousel.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/strong_points_section.dart';

class BlogPageLargeScreen extends StatefulWidget {
  const BlogPageLargeScreen({super.key});

  @override
  State<BlogPageLargeScreen> createState() => _BlogPageLargeScreenState();
}

class _BlogPageLargeScreenState extends State<BlogPageLargeScreen> {
  @override
  void initState() {
    context.read<RecentBlogPostsBloc>().add(FetchMostRecentBlogPosts(4));
    context.read<AllBlogPostsBloc>().add(FetchAllBlogPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(screenSize.width, navBarHeight),
            child: const NavigationBarContentsLargeScreen()),
        body: Stack(
          children: [
            // CONTENT
            GestureDetector(
              onTap: () {
                context.read<DropdownMenuBloc>().add(HideMenuEvent());
              },
              child: _content(screenSize, context),
            ),
            // NAVBAR MEGA-DROPDOWN MENUS
            const DropdownMenuExpertises(),
            const DropdownMenuOffers(),
            const DropdownMenuAboutUs(),
            //SEARCH BAR
            const SearchNavBar(
              placeholder:
                  "Cherchez une page, un service, un article, une offre d'emploi...",
            )
          ],
        ));
  }

  _content(Size screenSize, context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _getBlogBanner(
                  mediaScreenSize: screenSize), //blog carousel title embedded
              const SizedBox(height: 70),
              _getBlogInfosTitleEmbeded(),
              const SizedBox(height: 50),
              _getListNumber(),
              const SizedBox(height: 50),
              const FooterLargeScreen(),
            ],
          ),
        ),
      ),
    );
  }

//CarouselItem
  _getBlogBanner({required Size mediaScreenSize}) {
    double height = mediaScreenSize.height / 1.4;
    double width = mediaScreenSize.width;
    // List<Map> recentNews = [
    //   {
    //     'title': 'Optimisation SEO pour les Sites Web en 2024',
    //     'imagePath': 'assets/blog_images/homepage-concept-with-search-bar.jpg',
    //     'text':
    //         "Les dernières techniques de SEO pour aider votre site web à se classer plus haut dans les résultats de recherche",
    //     'boldTextList': [''],
    //     'date': '15/06/2024'
    //   },
    //   {
    //     'title':
    //         'Flutter vs React Native : Quelle Technologie Choisir en 2024 ',
    //     'imagePath':
    //         'assets/blog_images/representations-user-experience-interface-design.jpg',
    //     'text':
    //         "Analyse comparative entre Flutter et React Native, couvrant les performances, la facilité d'utilisation, la communauté et les perspectives d'avenir pour aider les développeurs à faire le bon choix.",
    //     'boldTextList': [''],
    //     'date': '10/06/2024'
    //   },
    //   {
    //     'title':
    //         '15 Astuces Indispensables pour Accélérer le Développement Mobile',
    //     'imagePath':
    //         'assets/blog_images/businessman-checking-stock-market-online.jpg',
    //     'text':
    //         "Découvrez des astuces pratiques pour optimiser votre flux de travail et développer des applications mobiles plus rapidement et plus efficacement",
    //     'boldTextList': [''],
    //     'date': '05/06/2024'
    //   },
    //   {
    //     'title':
    //         'Les Meilleures Pratiques pour Sécuriser Votre Application Mobile',
    //     'imagePath': 'assets/blog_images/iphone1200x628-v4-fr.jpg',
    //     'text':
    //         "Guide complet sur les mesures de sécurité à prendre lors du développement d'applications mobiles pour protéger les données des utilisateurs",
    //     'boldTextList': [''],
    //     'date': '05/06/2024'
    //   },
    // ];

    return BlocBuilder<RecentBlogPostsBloc, BlogPostState>(
      builder: (context, state) {
        if (state is RecentBlogPostLoaded) {
          return CustomCarousel(
              color: Colors.white,
              viewportFraction: 1,
              carouselHeight: height,
              widgets: state.blogPosts
                  .map(
                    (item) => RecentBlogCarouselSection(
                        blogPost: item, height: height, width: width),
                  )
                  .toList());
        } else if (state is BlogPostInitial) {
          return const CircularProgressIndicator();
        } else if (state is BlogPostError) {
          return SizedBox(
              height: 100,
              child: Text('Something went wrong : ${state.errorMessage}'));
        } else {
          return const SizedBox(
              height: 100, child: Text('Something went wrong'));
        }
      },
    );
  }

// GET NEWS
  _getBlogInfosTitleEmbeded() {
    return Column(
      children: [
        const CustomUnderlineTitle(
          title: 'Le Blog OHana Entreprise ',
        ),
        const SizedBox(height: 40),
        _getBlogCards()
      ],
    );
  }

  Widget _getBlogCards() {
    return BlocBuilder<AllBlogPostsBloc, BlogPostState>(
      builder: (context, state) {
        if (state is BlogPostLoaded) {
          return BlogCardPattern(
            blogList: state.blogPosts,
          );
        } else if (state is BlogPostInitial) {
          return const CircularProgressIndicator();
        } else if (state is BlogPostError) {
          return SizedBox(
              height: 100,
              child: Text('Something went wrong : ${state.errorMessage}'));
        } else {
          return const SizedBox(
              height: 100, child: Text('Something went wrong'));
        }
      },
    );
  }

//NUMBER LIST
  _getListNumber() {
    return CustomSmartPaginator(
      startIndicator: 1,
      endIndicator: 4,
      onTap: () {},
    );
  }
}

class RecentBlogCarouselSection extends StatelessWidget {
  const RecentBlogCarouselSection({
    super.key,
    required this.height,
    required this.width,
    required this.blogPost,
  });

  final double height;
  final double width;
  final BlogPost blogPost;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // padding: EdgeInsets.symmetric(),
        width: width,
        child: Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.srcATop,
              ),
              child: Image.asset(
                blogPost.imagePath,
                height: height,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //tite
                  SizedBox(
                    width: 700, //control text width
                    child: Text(
                      blogPost.title,
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //date of article
                  Text(
                    blogPost.creationDate.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  // 'See more' Buton

                  SizedBox(
                    width: 600,
                    height: 80,
                    child: Text(
                      blogPost.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  // 'See more' Buton
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Colors.white, // Couleur du texte du bouton
                      backgroundColor: const Color.fromARGB(
                          255, 221, 89, 245), // Couleur de fond du bouton
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Voir Plus',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
