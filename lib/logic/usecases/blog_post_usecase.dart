import 'package:ohana_webapp_flutter/data/repositories/mock/blog_post_hardcoded_repository.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/repositories/blog_post_repository.dart';

class BlogPostUsecase {
  BlogPostRepository blogPostRepository;

  BlogPostUsecase({BlogPostRepository? blogPostRepository})
      : blogPostRepository =
            blogPostRepository ?? BlogPostHardCodedRepository();

  Future<List<BlogPost>> getAllBlogArticles() {
    return blogPostRepository.getAllBlogPosts();
  }

  Future<List<BlogPost>> getMostRecentBlogPosts(int number) {
    return blogPostRepository.getMostRecentBlogPosts(number: number);
  }

  Future<BlogPost> getSingleBlogPost(String id) {
    return blogPostRepository.getSingleBlogPost(id: id);
  }

  Future<List<BlogPost>> getSearchBlogPost(String searchQuery) {
    return blogPostRepository.getSearchBlogPost(searchQuery);
  }

//PAGINATING LOGIC

  Future<List<BlogPost>> getFirstBlogPostsPage() {
    return blogPostRepository.getFirstBlogPostsPage();
  }

  Future<List<BlogPost>> getNextBlogPostsPage(String lastDocumentId) {
    return blogPostRepository.getNextBlogPostsPage(lastDocumentId);
  }

  Future<List<BlogPost>> getPreviousBlogPostsPage(String firstDocumentId) {
    return blogPostRepository.getPreviousBlogPostsPage(firstDocumentId);
  }

  Future<List<BlogPost>> getNthBlogPostsPage(int nth) {
    return blogPostRepository.getNthBlogPostsPage(nth);
  }
}
