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

class SingleBlogPostLoaded extends BlogPostState {
  final BlogPost singleBlogPost;

  const SingleBlogPostLoaded(this.singleBlogPost);

  @override
  List<Object> get props => [singleBlogPost];
}

class BlogPostError extends BlogPostState {
  final String errorMessage;

  const BlogPostError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class BlogPostPaginatingNumber extends BlogPostState {
  final int paginatingNumber;

  const BlogPostPaginatingNumber(this.paginatingNumber);

  @override
  List<Object> get props => [paginatingNumber];
}
