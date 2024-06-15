import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/repositories/blog_post_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ohana_webapp_flutter/firebase_options.dart';

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
