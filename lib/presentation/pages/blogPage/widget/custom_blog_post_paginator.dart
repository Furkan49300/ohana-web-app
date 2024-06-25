import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/data/repositories/firebase/blog_post_firebase_repository.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/paginated_blog_posts_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_state.dart';

import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';

class CustomBlogPostSmartPaginator extends StatefulWidget {
  CustomBlogPostSmartPaginator({super.key});

  @override
  State<CustomBlogPostSmartPaginator> createState() =>
      _CustomBlogPostSmartPaginatorState();
}

class _CustomBlogPostSmartPaginatorState
    extends State<CustomBlogPostSmartPaginator> {
  int currentPageIndex = 1;
  bool previousPageDisabled = true;
  bool nextPageDisabled = false;
  int startIndicator = 1; // default value
  int endIndicator = 0; //default value
  late int blogPostPaginatingNumber;

  @override
  void initState() {
    super.initState();
    _getEndIndicator();
  }

  void _getEndIndicator() async {
    blogPostPaginatingNumber =
        await BlogPostFirebaseRepository().getBlogPostsPaginatingNumber();
    setState(() {
      endIndicator =
          blogPostPaginatingNumber < 4 ? blogPostPaginatingNumber : 4;
      nextPageDisabled = blogPostPaginatingNumber <= 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: [
        _previousPage(),
        for (var i = startIndicator; i <= endIndicator; i++) _getNthPage(i),
        const SizedBox(width: 10),
        _nextPage(),
      ],
    );
  }

  _previousPage() {
    return Button(
      '<',
      type: previousPageDisabled ? ButtonType.disabled : ButtonType.number,
      onTap: () {
        if (!previousPageDisabled) {
          BlogPostState currentState =
              context.read<PaginatedBlogPostsBloc>().state;
          if (currentState is BlogPostLoaded) {
            context.read<PaginatedBlogPostsBloc>().add(
                FetchPreviousBlogPostsPage(currentState.blogPosts.first.id));
          }
          setState(() {
            if (currentPageIndex > 1) {
              if (currentPageIndex == startIndicator && startIndicator != 1) {
                int previousEndIndicator = endIndicator;
                endIndicator = startIndicator;
                startIndicator =
                    ((startIndicator - 4) > 0 && previousEndIndicator != 4)
                        ? (startIndicator - 4)
                        : 1;
              }
              currentPageIndex--;
              previousPageDisabled = currentPageIndex == 1;
              nextPageDisabled = false;
              _updateIndicatorOnPreviousPage();
            }
          });
        }
      },
    );
  }

  _updateIndicatorOnPreviousPage() {
    if (currentPageIndex == startIndicator && startIndicator != 1) {
      endIndicator = startIndicator;
      startIndicator = ((startIndicator - 4) > 0 && endIndicator != 4)
          ? (startIndicator - 4)
          : 1;
    }
  }

  _getNthPage(i) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Button(
          i.toString(),
          type: currentPageIndex == i ? ButtonType.disabled : ButtonType.number,
          onTap: () {
            context
                .read<PaginatedBlogPostsBloc>()
                .add(FetchNthBlogPostsPage(numberPage: i));
            setState(() {
              currentPageIndex = i; // get the current page index
              previousPageDisabled =
                  currentPageIndex == 1; // Disable previous button
              nextPageDisabled = currentPageIndex ==
                  blogPostPaginatingNumber; // Disable next button
            });
          },
        ));
  }

  _nextPage() {
    return Button(
      '>',
      type: nextPageDisabled ? ButtonType.disabled : ButtonType.number,
      onTap: () {
        if (!nextPageDisabled) {
          BlogPostState currentState =
              context.read<PaginatedBlogPostsBloc>().state;
          if (currentState is BlogPostLoaded) {
            context
                .read<PaginatedBlogPostsBloc>()
                .add(FetchNextBlogPostsPage(currentState.blogPosts.last.id));
          }
          setState(() {
            _updateIndicatorOnNextPage();
            currentPageIndex++;
            nextPageDisabled = currentPageIndex == endIndicator;
            previousPageDisabled = false;
          });
        }
      },
    );
  }

  _updateIndicatorOnNextPage() {
    if (currentPageIndex == endIndicator) {
      if ((blogPostPaginatingNumber - currentPageIndex) < 4) {
        startIndicator = endIndicator;
        endIndicator = blogPostPaginatingNumber;
      } else {
        startIndicator = endIndicator;
        endIndicator = endIndicator + 4;
      }
    }
  }
}
