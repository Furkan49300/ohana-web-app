import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohana_webapp_flutter/data/repositories/firebase/blog_post_firebase_repository.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/usecases/blog_post_usecase.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_state.dart';

class RecentBlogPostsBloc extends Bloc<BlogPostEvent, BlogPostState> {
  RecentBlogPostsBloc() : super(BlogPostInitial()) {
    on<FetchMostRecentBlogPosts>(_onFetchMostRecentBlogPosts);
  }

  void _onFetchMostRecentBlogPosts(
      FetchMostRecentBlogPosts event, Emitter<BlogPostState> emit) async {
    emit(BlogPostInitial()); // Affiche le CircularProgressIndicator

    try {
      // Récupérer les articles du blog
      final List<BlogPost> blogPosts = await BlogPostUsecase(
              blogPostRepository: BlogPostFirebaseRepository())
          .getMostRecentBlogPosts(event.number);

      // Retourner les articles du blog
      emit(BlogPostLoaded(blogPosts));
    } catch (e) {
      // Gérer les erreurs
      emit(BlogPostError(e.toString())); // Affiche un message d'erreur
    }
  }
}
