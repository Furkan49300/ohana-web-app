import 'package:ohana_webapp_flutter/logic/entities/blog_post_content.dart';

class BlogPost {
  final double id;
  final String title;
  final String author;
  final String description;
  final DateTime creationDate;
  final BlogPostContent content;

  const BlogPost(this.id, this.title, this.description, this.creationDate,
      this.content, this.author);
}
