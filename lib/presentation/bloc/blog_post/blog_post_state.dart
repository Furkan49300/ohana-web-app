import 'package:equatable/equatable.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';

abstract class BlogPostState extends Equatable {
  const BlogPostState();
  @override
  List<Object> get props => [];
}

class BlogPostInitial extends BlogPostState {}

class BlogPostLoaded extends BlogPostState {
  final List<BlogPost> blogPosts;

  const BlogPostLoaded(this.blogPosts);

  @override
  List<Object> get props => [blogPosts];
}
