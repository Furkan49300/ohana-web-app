import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';

abstract class BlogPostRepository {
  List<BlogPost> getAllBlogPosts();
}
