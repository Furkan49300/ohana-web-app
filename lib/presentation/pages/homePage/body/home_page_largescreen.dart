import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:ohana_webapp_flutter/presentation/pages/homePage/widgets/expertises_card.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/blog_card_pattern.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/partners_carousel.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/strong_points_section.dart';

class HomePageLargeScreen extends StatefulWidget {
  const HomePageLargeScreen({super.key});

  @override
  State<HomePageLargeScreen> createState() => _HomePageLargeScreenState();
}

class _HomePageLargeScreenState extends State<HomePageLargeScreen> {
  @override
  void initState() {
    context.read<RecentBlogPostsBloc>().add(FetchMostRecentBlogPosts(2));
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
              const CustomBanner(
                message: "BIENVENUE A OHANA ENTREPRISE",
                imagePath:
                    'assets/homepage_image/programming-background-collage.jpg',
              ),
              const ExpertisesList(),
              const SizedBox(height: 70),
              const StrongPointsSection(),
              const SizedBox(height: 50),
              const OurPartners(),
              const SizedBox(height: 50),
              _getTwoLastBlogs(),
              const SizedBox(height: 150),
              const FooterLargeScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

//----EXPERTISE

class ExpertisesList extends StatelessWidget {
  const ExpertisesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.only(top: 10),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: spaceLeftBigTitle,
              ),
              CustomUnderlineTitle(
                title: 'Expertises',
              )
            ],
          ),
          SizedBox(
            height: spaceBetweenBigTitleAndTextBody,
          ),
          Wrap(
            spacing: 40, //horizontal space between children
            alignment: WrapAlignment.center,
            children: [
              ExpertisesCard(
                  svgLink: 'dev_services/devLogo.svg', title: 'DÉVELOPPEMENT'),
              ExpertisesCard(
                  svgLink: 'dev_services/design.svg', title: 'DESIGN'),
              ExpertisesCard(
                  svgLink: 'dev_services/locked.svg', title: 'CYBERSECURITÉ'),
              ExpertisesCard(
                  svgLink: 'dev_services/ref.svg', title: 'RÉFÉRENCEMENT'),
              ExpertisesCard(
                  svgLink: 'dev_services/testValidate.svg', title: 'TESTING'),
              ExpertisesCard(
                  svgLink: 'dev_services/increase.svg', title: 'IA GENERATIVE'),
            ],
          )
        ],
      ),
    );
  }
}

//----OUR PARTNER

class OurPartners extends StatelessWidget {
  const OurPartners({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomUnderlineTitle(title: 'IL NOUS FONT CONFIANCE'),
        SizedBox(height: spaceBetweenBigTitleAndTextBody),
        PartnersCarousel(),
      ],
    );
  }
}

// GET NEWS
_getTwoLastBlogs() {
  return Column(
    children: [
      const CustomUnderlineTitle(
        title: 'Derniers articles',
      ),
      const SizedBox(height: 40),
      _getBlogCards()
    ],
  );
}

Widget _getBlogCards() {
  return BlocBuilder<RecentBlogPostsBloc, BlogPostState>(
    builder: (context, state) {
      if (state is RecentBlogPostLoaded) {
        return BlogCardPattern(
          blogList: state.blogPosts,
          cardWidth: 600,
        );
      } else if (state is BlogPostInitial) {
        return const CircularProgressIndicator();
      } else if (state is BlogPostError) {
        return SizedBox(
            height: 100,
            child: Text('Something went wrong : ${state.errorMessage}'));
      } else {
        return const SizedBox(height: 100, child: Text('Something went wrong'));
      }
    },
  );
}
