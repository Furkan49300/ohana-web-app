import 'package:intl/intl.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post_content.dart';
import 'package:ohana_webapp_flutter/logic/entities/job_offer.dart';

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

JobOffer jsonToJobOffer(Map json) {
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  return JobOffer(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      content: "",
      profil: json['profil'],
      imagePath: json['image'],
      place: json['place'],
      duration: json['duration'],
      contract: json['contract'],
      salary: json['salary'],
      pulishDate: dateFormat.parse(json['publish_date']),
      alert: json['alert']);
}
