import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post_content.dart';
import 'package:ohana_webapp_flutter/logic/repositories/blog_post_repository.dart';

class BlogPostFirebaseRepository implements BlogPostRepository {
  final int pageSize = 6;
  final String blogCollection = 'article';

//NUMBER OF BLOG POST PAGE

  @override
  Future<int> getBlogPostsPaginatingNumber() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(blogCollection).get();
    int numberOfUsers = querySnapshot.size;
    double pagesNumberFraction = numberOfUsers / pageSize;
    int blogPagesNumber = pagesNumberFraction.ceil();
    return blogPagesNumber;
  }

//ALL BLOG

  @override
  Future<List<BlogPost>> getAllBlogPosts() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(blogCollection).get();
    return querySnapshot.docs.map(_blogPostMapping).toList();
  }

//RECENT BLOG

  @override
  Future<List<BlogPost>> getMostRecentBlogPosts({required int number}) async {
    // Récupère une référence à la collection blogCollection
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(blogCollection)
        .orderBy('publish_date', descending: true)
        .limit(number)
        .get();

    // Parcourt les documents dans la collection
    return querySnapshot.docs.map(_blogPostMapping).toList();
  }

//SPECIFIC BLOG

  @override
  Future<BlogPost> getSingleBlogPost({required String id}) async {
    // Recuperer le dernier document via son Id
    DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(blogCollection)
        .doc(id)
        .get();

    return _blogPostMapping(querySnapshot);
  }

//SEARCH BLOG POSTS

  @override
  Future<List<BlogPost>> getSearchBlogPost(String searchQuery) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(blogCollection)
        .orderBy('title')
        .where('title', isEqualTo: searchQuery)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return querySnapshot.docs.map((doc) => _blogPostMapping(doc)).toList();
    } else {
      return [];
    }
  }

//PAGINATOR GESTURE

// First BLOG PAGE

  @override
  Future<List<BlogPost>> getFirstBlogPostsPage() async {
    // Récupère une référence à la collection blogCollection
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(blogCollection)
        .orderBy('publish_date', descending: true)
        .limit(pageSize)
        .get();

    // Parcourt les documents dans la collection
    return querySnapshot.docs.map(_blogPostMapping).toList();
  }

// NEXT BLOG PAGE

  @override
  Future<List<BlogPost>> getNextBlogPostsPage(String lastDocumentId) async {
    // 1 - Recuperer le dernier document via son Id
    DocumentSnapshot lastDocSnapshot = await FirebaseFirestore.instance
        .collection('')
        .doc(lastDocumentId)
        .get();

    // Step 2: Utiliser startAfter avec le document recuperé
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(blogCollection)
        .orderBy('publish_date', descending: true)
        .startAfterDocument(lastDocSnapshot)
        .limit(pageSize)
        .get();

    // Parcourt les documents dans la collection
    return querySnapshot.docs.map(_blogPostMapping).toList();
  }

//PREVIOUS BLOG POST

  @override
  Future<List<BlogPost>> getPreviousBlogPostsPage(
      String firstDocumentId) async {
    // 1 - Recuperer le dernier document via son Id
    DocumentSnapshot firstDocSnapshot = await FirebaseFirestore.instance
        .collection(blogCollection)
        .doc(firstDocumentId)
        .get();

    // Step 2: Utiliser startBefore avec le document recuperé
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(blogCollection)
        .orderBy('publish_date', descending: true)
        .endBeforeDocument(firstDocSnapshot)
        // .limit(pageSize)
        .get();

    List<QueryDocumentSnapshot> querySnapshotreverse =
        querySnapshot.docs.reversed.take(pageSize).toList();

    // Parcourt les documents dans la collection
    return querySnapshotreverse.map(_blogPostMapping).toList();
  }

//NTH BLOG  PAGE

  @override
  Future<List<BlogPost>> getNthBlogPostsPage(nPage) async {
    Query query = FirebaseFirestore.instance
        .collection(blogCollection)
        .orderBy('publish_date', descending: true);
    DocumentSnapshot lastDocument;
    for (int i = 1; i < nPage; i++) {
      QuerySnapshot querySnapshot = await query.limit(pageSize).get();
      if (querySnapshot.docs.isEmpty) {
        return []; // Si aucune donnée n'est trouvée, retourner une liste vide
      }
      lastDocument = querySnapshot.docs.last;
      query = query.startAfterDocument(lastDocument);
    }
    QuerySnapshot querySnapshot = await query.limit(pageSize).get();
    return querySnapshot.docs.map(_blogPostMapping).toList();
  }

//MAPPER

  BlogPost _blogPostMapping(doc) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    List<BlogPostContent> content = [];
    for (Map paragraph in data['paragraphs']) {
      content.add(BlogPostContent(
          textContent: paragraph["text"], imagePath: paragraph["url_image"]));
    }
    return BlogPost(
      id: doc.id,
      title: data["title"],
      description: data["description"],
      creationDate: data["publish_date"].toDate(),
      content: content,
      author: data["author"] ?? 'OHana Entreprise',
      imagePath: data["image"],
      updateDate: data["update_date"].toDate() ?? data["publish_date"].toDate(),
    );
  }
}
