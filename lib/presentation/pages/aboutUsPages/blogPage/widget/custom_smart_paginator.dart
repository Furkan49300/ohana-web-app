import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/paginated_blog_posts_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_state.dart';

import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';

class CustomSmartPaginator extends StatefulWidget {
  const CustomSmartPaginator(
      {super.key, required this.startIndicator, required this.endIndicator});
  final int startIndicator;
  final int endIndicator;

  @override
  State<CustomSmartPaginator> createState() => _CustomSmartPaginatorState();
}

class _CustomSmartPaginatorState extends State<CustomSmartPaginator> {
  int currentPageIndex = 0;
  bool previousPageDisabled = true;
  bool nextPageDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: [
        _previousPage(),
        for (var i = widget.startIndicator; i <= widget.endIndicator; i++)
          _getNthPage(i),
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
              currentPageIndex--;
              previousPageDisabled = currentPageIndex == widget.startIndicator;
              nextPageDisabled = false;
            }
          });
        }
      },
    );
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
                  false; //disabel the light effect on the previous button
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
            currentPageIndex = currentPageIndex + 1;
            nextPageDisabled = currentPageIndex == widget.endIndicator;
            previousPageDisabled = false;
          });
        }
      },
    );
  }
}
