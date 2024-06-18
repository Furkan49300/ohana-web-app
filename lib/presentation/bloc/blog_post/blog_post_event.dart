abstract class BlogPostEvent {}

// ALL BLOG POSTS
class FetchAllBlogPosts extends BlogPostEvent {}

// PAGINATED BLOG POSTS
class FetchFirstBlogPostsPage extends BlogPostEvent {}

class FetchPreviousBlogPostsPage extends BlogPostEvent {
  final String firstDocumentId;
  FetchPreviousBlogPostsPage(this.firstDocumentId);
}

class FetchNextBlogPostsPage extends BlogPostEvent {
  final String lastDocumentId;
  FetchNextBlogPostsPage(this.lastDocumentId);
}

class FetchNthBlogPostsPage extends BlogPostEvent {
  int numberPage;
  FetchNthBlogPostsPage({required this.numberPage});
}

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
