abstract class BlogPostEvent {}

class FetchAllBlogPosts extends BlogPostEvent {}

class FetchMostRecentBlogPosts extends BlogPostEvent {
  final int number;

  FetchMostRecentBlogPosts(this.number);
}
