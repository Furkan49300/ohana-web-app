import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/paginated_blog_posts_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/recent_blog_posts_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/single_blog_post_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_state.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_screen_fit.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navbar_responsiveness.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/pages/blogPage/widget/custom_blog_post_paginator.dart';
import 'package:ohana_webapp_flutter/presentation/pages/responsive.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/blog_card_pattern.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_carousel.dart';

class BlogPageLargeScreen extends StatefulWidget {
  const BlogPageLargeScreen({super.key});

  @override
  State<BlogPageLargeScreen> createState() => _BlogPageLargeScreenState();
}

class _BlogPageLargeScreenState extends State<BlogPageLargeScreen> {
  @override
  void initState() {
    context.read<RecentBlogPostsBloc>().add(FetchMostRecentBlogPosts(4));
    context.read<PaginatedBlogPostsBloc>().add(FetchFirstBlogPostsPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Responsive.getScreenSize(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: NavbarResponsiveness.getNavbar(screenSize.width),
        endDrawer: NavbarResponsiveness.getEndDrawer(screenSize.width),
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
            SearchNavBar(
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
              _getPaginatorButtons(),
              const SizedBox(height: 50),
              const Footer(),
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

    return BlocBuilder<RecentBlogPostsBloc, BlogPostState>(
      builder: (context, state) {
        if (state is BlogPostLoaded) {
          return CustomCarousel(
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
    return BlocBuilder<PaginatedBlogPostsBloc, BlogPostState>(
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
  _getPaginatorButtons() {
    return const CustomBlogPostSmartPaginator(
        startIndicator: 1, endIndicator: 4);
  }
}

class RecentBlogCarouselSection extends StatelessWidget {
  //ATTRIBUTE

  const RecentBlogCarouselSection({
    super.key,
    required this.height,
    required this.width,
    required this.blogPost,
  });

  final double height;
  final double width;
  final BlogPost blogPost;

//CONTENT

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Stack(
          children: [
            _getBackImage(),
            Padding(
              padding: const EdgeInsets.all(90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getTitle(),
                  const SizedBox(height: 20),
                  _getDate(),
                  const SizedBox(height: 20),
                  // 'See more' Buton
                  _getDescription(),
                  // 'See more' Buton
                  const SizedBox(height: 10),
                  _getButton(context),
                ],
              ),
            ),
          ],
        ));
  }

//IMAGE

  _getBackImage() {
    return ColorFiltered(
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
    );
  }

//TITLE

  _getTitle() {
    return SizedBox(
      child: Text(
        blogPost.title,
        style: const TextStyle(
            fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

//DATE

  _getDate() {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String dateFormatted = dateFormat.format(blogPost.creationDate);
    return Text(
      dateFormatted,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

//DESCRIPTION

  _getDescription() {
    return SizedBox(
      child: Text(
        blogPost.description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

// VIEW MORE BUTTON

  _getButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        //open one recent blog post
        context
            .read<SingleBlogPostBloc>()
            .add(FetchSingleBlogPost(blogPost.id));
      },
      style: TextButton.styleFrom(
          foregroundColor: Colors.white, // Couleur du texte du bouton
          backgroundColor: const Color.fromARGB(
              255, 221, 89, 245) // Couleur de fond du bouton
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
    );
  }
}
