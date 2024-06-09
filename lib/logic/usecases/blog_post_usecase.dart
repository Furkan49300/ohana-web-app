import 'package:ohana_webapp_flutter/data/exception/blog_post_network_exception.dart';
import 'package:ohana_webapp_flutter/data/exception/blog_post_server_exception.dart';
import 'package:ohana_webapp_flutter/data/repositories/blog_post_hardcoded_repository.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/repositories/blog_post_repository.dart';

class BlogPostUsecase {
  BlogPostRepository blogPostRepository;

  BlogPostUsecase({BlogPostRepository? blogPostRepository})
      : blogPostRepository =
            blogPostRepository ?? BlogPostHardCodedRepository();

  getAllBlogArticles() async {
    try {
      List<BlogPost> blogPosts = await blogPostRepository.getAllBlogPosts();
      return blogPosts;
    } catch (e) {
      print(e.toString());
    }
  }
}
