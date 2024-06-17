import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blocs/paginated_blog_posts_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_state.dart';

import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';

class CustomSmartPaginator extends StatelessWidget {
  const CustomSmartPaginator(
      {super.key, required this.startIndicator, required this.endIndicator});
  final int startIndicator;
  final int endIndicator;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: [
        Button(
          '<',
          type: ButtonType.number,
          onTap: () {},
        ),
        for (var i = startIndicator; i <= endIndicator; i++)
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Button(
                i.toString(),
                type: ButtonType.number,
                onTap: () {},
              )),
        const SizedBox(width: 10),
        Button(
          '>',
          type: ButtonType.number,
          onTap: () {
            BlogPostState currentState =
                context.read<PaginatedBlogPostsBloc>().state;
            if (currentState is BlogPostLoaded) {
              context
                  .read<PaginatedBlogPostsBloc>()
                  .add(FetchNextBlogPostsPage(currentState.blogPosts.last.id));
            }
          },
        ),
      ],
    );
  }
}
