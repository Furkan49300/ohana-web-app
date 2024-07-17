import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohana_webapp_flutter/data/repositories/firebase/blog_post_firebase_repository.dart';

import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/usecases/blog_post_usecase.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/blog_post/blog_post_state.dart';

class SingleBlogPostBloc extends Bloc<BlogPostEvent, BlogPostState> {
  SingleBlogPostBloc() : super(BlogPostInitial()) {
    // Gestion de l'événement FetchSingleBlogPost
    on<FetchSingleBlogPost>((event, emit) async {
      print("Fetching blog post with ID: ${event.id}");
      try {
        // Récupérer l'article du blog
        final BlogPost blogPost = await BlogPostUsecase(
                blogPostRepository: BlogPostFirebaseRepository())
            .getSingleBlogPost(event.id);

        // Retourner l'article du blog
        emit(SingleBlogPostLoaded(blogPost));
        print("Blog post loaded: ${blogPost.title}");
      } catch (e) {
        // Gérer les erreurs
        emit(BlogPostError(e.toString())); // Affiche un message d'erreur
        print("Error fetching blog post: $e");
      }
    });

    // Gestion de l'événement ResetSingleBlogPostEvent
    on<ResetSingleBlogPostEvent>((event, emit) {
      print("Resetting SingleBlogPostBloc state");
      emit(BlogPostInitial());
    });
  }
}
