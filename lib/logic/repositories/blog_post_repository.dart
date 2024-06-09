import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';

abstract class BlogPostRepository {
  Future<List<BlogPost>> getAllBlogPosts();
}
