import 'package:ohana_webapp_flutter/logic/entities/blog_post_content.dart';

class BlogPost {
  final String id;
  final String title;
  final String author;
  final String description;
  final DateTime creationDate;
  final DateTime updateDate;
  final List<BlogPostContent> content;
  final String imagePath;

  const BlogPost({
    required this.id,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.content,
    required this.author,
    required this.imagePath,
    required this.updateDate,
  });
}
