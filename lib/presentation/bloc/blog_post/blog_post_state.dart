import 'package:equatable/equatable.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';

abstract class BlogPostState extends Equatable {
  const BlogPostState();
  @override
  List<Object> get props => [];
}

//Initial

class BlogPostInitial extends BlogPostState {}

class BlogPostLoaded extends BlogPostState {
  final List<BlogPost> blogPosts;

  const BlogPostLoaded(this.blogPosts);

  @override
  List<Object> get props => [blogPosts];
}

//RECENT BLOG

class RecentBlogPostLoaded extends BlogPostState {
  final List<BlogPost> blogPosts;

  const RecentBlogPostLoaded(this.blogPosts);

  @override
  List<Object> get props => [blogPosts];
}

// SINGLE BLOG POST

class SingleBlogPostLoaded extends BlogPostState {
  final BlogPost singleBlogPost;

  const SingleBlogPostLoaded(this.singleBlogPost);

  @override
  List<Object> get props => [singleBlogPost];
}

//BLOG POST ERROR

class BlogPostError extends BlogPostState {
  final String errorMessage;

  const BlogPostError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
