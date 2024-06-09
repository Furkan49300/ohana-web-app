import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohana_webapp_flutter/data/repositories/blog_post_hardcoded_repository.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/usecases/blog_post_usecase.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_state.dart';

class BlogPostBloc extends Bloc<BlogPostEvent, BlogPostState> {
  BlogPostBloc() : super(BlogPostInitial()) {
    on<FetchAllBlogPosts>(_onFetchAllBlogPosts);
  }

  void _onFetchAllBlogPosts(
      FetchAllBlogPosts event, Emitter<BlogPostState> emit) {
    // Récupération de données
    BlogPostUsecase usecase =
        BlogPostUsecase(blogPostRepository: BlogPostHardCodedRepository());

    List<BlogPost> blogPosts = usecase.getAllBlogArticles();
    emit(BlogPostLoaded(blogPosts));
  }
}
