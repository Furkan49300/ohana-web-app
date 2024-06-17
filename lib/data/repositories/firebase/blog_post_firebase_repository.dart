import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post_content.dart';
import 'package:ohana_webapp_flutter/logic/repositories/blog_post_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ohana_webapp_flutter/data/repositories/firebase/firebase_options.dart';

class BlogPostFirebaseRepository implements BlogPostRepository {
  @override
  Future<List<BlogPost>> getAllBlogPosts() async {
    // Récupère une référence à la collection 'blogposts'
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('blogposts').get();

    // Parcourt les documents dans la collection
    return querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;

      List<BlogPostContent> content = [];
      for (Map paragraph in data['paragraphs']) {
        content.add(BlogPostContent(textContent: paragraph["quill_content"]));
      }

      return BlogPost(
          id: doc.id,
          title: data["title"],
          description: data["description"],
          creationDate: data["publish_date"].toDate(),
          content: content,
          author: data["author"],
          imagePath: data["image"]);
    }).toList();
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
