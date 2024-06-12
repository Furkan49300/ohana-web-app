import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:ohana_webapp_flutter/logic/entities/blog_post_content.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/single_blog_post_bloc.dart';
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
            const SearchNavBar(
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
          Center(
            child: BlocBuilder<SingleBlogPostBloc, BlogPostState>(
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
                        child: SizedBox(
                          width: screenSize.width * 0.55,
                          child: quill.QuillEditor.basic(
                            configurations: quill.QuillEditorConfigurations(
                                controller: quillController,
                                enableInteractiveSelection: false),
                          ),
                        ),
                      );
                    }).toList();
                    return Column(
                      children: blogView,
                    );
                  } catch (error) {
                    return SizedBox(
                        height: screenSize.height * 0.7,
                        child: Center(
                          child: Text('Something went wrong : $error',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                        ));
                  }
                } else if (state is BlogPostInitial) {
                  return SizedBox(
                    height: screenSize.height * 0.7,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('is Loading...',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        CircularProgressIndicator()
                      ],
                    ),
                  );
                } else if (state is BlogPostError) {
                  return SizedBox(
                      height: screenSize.height * 0.7,
                      child: Center(
                        child: Text(
                            'Something went wrong : ${state.errorMessage}',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ));
                } else {
                  return SizedBox(
                      height: screenSize.height * 0.7,
                      child: const Center(
                        child: Text('Something went wrong',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ));
                }
              },
            ),
          ),
          const SizedBox(height: 30),
          const FooterLargeScreen()
        ],
      ),
    );
  }
}

  // quill.Document quillDocument =
  //                       quill.Document.fromJson(jsonDecode('{}'));
  //                   _quillController = quill.QuillController(
  //                       document: quillDocument,
  //                       selection: const TextSelection.collapsed(offset: 0));
                    // return SizedBox(
                    //   width: screenSize.width * 0.55,
                    //   child: quill.QuillEditor.basic(
                    //     configurations: quill.QuillEditorConfigurations(
                    //         controller: _quillController,
                    //         enableInteractiveSelection: false),
                    //   ),
                    // );