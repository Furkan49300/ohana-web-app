import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post_content.dart';
import 'package:ohana_webapp_flutter/logic/repositories/blog_post_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ohana_webapp_flutter/data/repositories/firebase/firebase_options.dart';

class BlogPostFirebaseRepository implements BlogPostRepository {
  final int pageSize = 6;

  @override
  Future<List<BlogPost>> getAllBlogPosts() async {
    // Récupère une référence à la collection 'blogposts'
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('blogposts').get();

    // Parcourt les documents dans la collection
    return querySnapshot.docs.map(_blogPostMapping).toList();
  }

  @override
  Future<List<BlogPost>> getMostRecentBlogPosts({required int number}) {
    // TODO: implement getMostRecentBlogPosts
    throw UnimplementedError();
  }

  @override
  Future<BlogPost> getSingleBlogPost({required String id}) async {
    // Recuperer le dernier document via son Id
    DocumentSnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('blogposts').doc(id).get();

    // Parcourt les documents dans la collection
    return _blogPostMapping(querySnapshot);
  }

  @override
  Future<List<BlogPost>> getFirstBlogPostsPage() async {
    // Récupère une référence à la collection 'blogposts'
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('blogposts')
        .orderBy('publish_date', descending: true)
        .limit(pageSize)
        .get();

    // Parcourt les documents dans la collection
    return querySnapshot.docs.map(_blogPostMapping).toList();
  }

  @override
  Future<List<BlogPost>> getNextBlogPostsPage(String lastDocumentId) async {
    // 1 - Recuperer le dernier document via son Id
    DocumentSnapshot lastDocSnapshot = await FirebaseFirestore.instance
        .collection('blogposts')
        .doc(lastDocumentId)
        .get();

    // Step 2: Utiliser startAfter avec le document recuperé
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('blogposts')
        .orderBy('publish_date', descending: true)
        .startAfterDocument(lastDocSnapshot)
        .limit(pageSize)
        .get();

    // Parcourt les documents dans la collection
    return querySnapshot.docs.map(_blogPostMapping).toList();
  }

  BlogPost _blogPostMapping(doc) {
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
  }
}
