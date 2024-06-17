import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:intl/intl.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post_content.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/single_blog_post_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_state.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_screen_fit.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navigation_bar_contents_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';

class SingleBlogPostPageLargeScreen extends StatefulWidget {
  const SingleBlogPostPageLargeScreen({super.key});

  @override
  State<SingleBlogPostPageLargeScreen> createState() =>
      _SingleBlogPostPageLargeScreenState();
}

class _SingleBlogPostPageLargeScreenState
    extends State<SingleBlogPostPageLargeScreen> {
  @override
  void initState() {
    // TODO: implement initState
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
            SearchNavBar(
              placeholder:
                  "Cherchez une page, un service, un article, une offre d'emploi...",
            )
          ],
        ));
  }

  _content(Size screenSize, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<SingleBlogPostBloc, BlogPostState>(
            builder: (context, state) {
              if (state is SingleBlogPostLoaded) {
                try {
                  List<Padding> blogView = state.singleBlogPost.content
                      .map((BlogPostContent blogPostContent) {
                    quill.Document quillDocument = quill.Document.fromJson(
                        jsonDecode(blogPostContent.textContent));
                    quill.QuillController quillController =
                        quill.QuillController(
                            document: quillDocument,
                            selection:
                                const TextSelection.collapsed(offset: 0));
                    return Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          quill.QuillEditor.basic(
                            configurations: quill.QuillEditorConfigurations(
                                controller: quillController,
                                enableInteractiveSelection: false),
                          ),
                          // Image.asset(blogPostContent.imagePath),
                        ],
                      ),
                    );
                  }).toList();
                  return _getTextBody(
                      screenSize: screenSize,
                      singleBlogPost: state.singleBlogPost,
                      blogView: blogView);
                } catch (error) {
                  return _getErrorMessage(
                      screenSize, 'Something went wrong : $error');
                }
              } else if (state is BlogPostInitial) {
                return _getErrorMessage(screenSize, 'is Loading...');
              } else if (state is BlogPostError) {
                return _getErrorMessage(
                    screenSize, 'Something went wrong : ${state.errorMessage}');
              } else {
                return _getErrorMessage(screenSize, 'Something went wrong');
              }
            },
          ),
          const SizedBox(height: 30),
          const Footer()
        ],
      ),
    );
  }

  SizedBox _getErrorMessage(Size screenSize, String text) {
    return SizedBox(
        height: screenSize.height * 0.7,
        child: Center(
          child: Text(text,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ));
  }

  _getTextBody(
      {required Size screenSize,
      required BlogPost singleBlogPost,
      required List blogView}) {
    const double widthBalance = 0.55;
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    String creationDateFormatted =
        dateFormat.format(singleBlogPost.creationDate);
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Image.asset(
          singleBlogPost.imagePath,
          width: screenSize.width,
          height: 500,
          fit: BoxFit.cover,
        ),
        Container(
          margin: const EdgeInsets.only(top: 300),
          padding: const EdgeInsets.all(50),
          color: Colors.white,
          child: SizedBox(
            width: screenSize.width * widthBalance,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  singleBlogPost.title,
                  style: const TextStyle(
                      fontSize: 34.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'Ecrit par ${singleBlogPost.author} le $creationDateFormatted, modifié le $creationDateFormatted ',
                  style: const TextStyle(fontSize: 19),
                ),
                const SizedBox(
                    width: 100,
                    child: Divider(
                      color: purpleNeutral,
                      thickness: 2,
                    )),
                const SizedBox(height: 50),
                Text(
                  singleBlogPost.description,
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                ...blogView
              ],
            ),
          ),
        ),
      ],
    );
  }
}
