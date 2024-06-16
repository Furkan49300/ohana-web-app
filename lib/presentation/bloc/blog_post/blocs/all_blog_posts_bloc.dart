import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohana_webapp_flutter/data/repositories/firebase/blog_post_firebase_repository.dart';
import 'package:ohana_webapp_flutter/data/repositories/mock/blog_post_hardcoded_repository.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/usecases/blog_post_usecase.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_state.dart';

class AllBlogPostsBloc extends Bloc<BlogPostEvent, BlogPostState> {
  AllBlogPostsBloc() : super(BlogPostInitial()) {
    on<FetchAllBlogPosts>(_onFetchAllBlogPosts);
  }

  void _onFetchAllBlogPosts(
      FetchAllBlogPosts event, Emitter<BlogPostState> emit) async {
    emit(BlogPostInitial()); // Affiche le CircularProgressIndicator

    try {
      // Récupérer les articles du blog
      final List<BlogPost> blogPosts = await BlogPostUsecase(
              blogPostRepository: BlogPostFirebaseRepository())
          .getAllBlogArticles();

      // Retourner les articles du blog
      emit(BlogPostLoaded(blogPosts));
    } catch (e) {
      // Gérer les erreurs
      emit(BlogPostError(e.toString())); // Affiche un message d'erreur
    }
  }
}
