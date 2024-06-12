import 'package:intl/intl.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post_content.dart';

BlogPost jsonToBlogPost(Map json) {
  List<BlogPostContent> content = [];
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  for (Map paragraph in json['paragraphs']) {
    content.add(BlogPostContent(
      textContent: paragraph["text"],
      imagePath: paragraph['url_image'],
      videoPath: paragraph['video'],
      subTitle: paragraph['subtitle'],
    ));
  }
  return BlogPost(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      creationDate: dateFormat.parse(json["date"]),
      content: content,
      author: "Dali Ange Paterne",
      imagePath: json['image']);
}
