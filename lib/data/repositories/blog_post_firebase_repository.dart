import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/repositories/blog_post_repository.dart';

class BlogPostFirebaseRepository implements BlogPostRepository {
  @override
  Future<List<BlogPost>> getAllBlogPosts() {
    // TODO: implement getAllBlogPosts
    throw UnimplementedError();
  }

  @override
  Future<List<BlogPost>> getMostRecentBlogPosts({required int number}) {
    // TODO: implement getMostRecentBlogPosts
    throw UnimplementedError();
  }

  @override
  Future<BlogPost> getSingleBlogPost({required String id}) {
    // TODO: implement getSpecificBlogPosts
    throw UnimplementedError();
  }
}
