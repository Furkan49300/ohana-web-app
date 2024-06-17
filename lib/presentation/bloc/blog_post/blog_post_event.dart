abstract class BlogPostEvent {}

// ALL BLOG POSTS
class FetchAllBlogPosts extends BlogPostEvent {}

// PAGINATED BLOG POSTS
class FetchFirstBlogPostsPage extends BlogPostEvent {}

class FetchPreviousBlogPostsPage extends BlogPostEvent {}

class FetchNextBlogPostsPage extends BlogPostEvent {}

class FetchNthBlogPostsPage extends BlogPostEvent {}

// SINGLE BLOG POST

class FetchSingleBlogPost extends BlogPostEvent {
  final String id;
  FetchSingleBlogPost(this.id);
}

//MOST RECENT BLOG POSTS

class FetchMostRecentBlogPosts extends BlogPostEvent {
  final int number;

  FetchMostRecentBlogPosts(this.number);
}
