import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohana_webapp_flutter/data/repositories/firebase/blog_post_firebase_repository.dart';

import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/usecases/blog_post_usecase.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_state.dart';

class SingleBlogPostBloc extends Bloc<BlogPostEvent, BlogPostState> {
  SingleBlogPostBloc() : super(BlogPostInitial()) {
    on<FetchSingleBlogPost>((event, emit) async {
      try {
        // Récupérer l'article' du blog
        final BlogPost blogPost = await BlogPostUsecase(
                blogPostRepository: BlogPostFirebaseRepository())
            .getSingleBlogPost(event.id);

        // Retourner l' articles du blog
        emit(SingleBlogPostLoaded(blogPost));
      } catch (e) {
        // Gérer les erreurs
        emit(BlogPostError(e.toString())); // Affiche un message d'erreur
      }
    });
  }
}
