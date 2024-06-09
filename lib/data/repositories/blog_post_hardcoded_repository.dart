import 'package:intl/intl.dart';

import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/repositories/blog_post_repository.dart';

class BlogPostHardCodedRepository implements BlogPostRepository {
  List<Map> blogPosts = [
    {
      'id': 1,
      'title':
          'Développez Votre Première Application Mobile en Flutter : Un Guide Pas à Pas',
      'imagePath': 'assets/blog_images/flutterCover.webp',
      'text':
          "Ce tutoriel vous guidera à travers le processus de développement d'une application mobile de base avec Flutter, y compris la configuration de l'environnement, la création d'une interface utilisateur et le déploiement de l'application. ",
      'boldTextList': [''],
      'date': '05/06/2024'
    },
    {
      'id': 2,
      'title':
          "Étude de Cas : Réussite de la Transformation Numérique de l'Entreprise ABC",
      'imagePath': 'assets/blog_images/UnArticleABC-720x544.png',
      'text':
          "Découvrez comment nous avons aidé l'entreprise ABC à transformer son site web en une plateforme numérique moderne, en améliorant l'expérience utilisateur et en augmentant les conversions de 30%.",
      'boldTextList': [''],
      'date': '06/06/2024'
    },
    {
      'id': 3,
      'title':
          "Optimisation SEO pour les Sites Web en 2024 : Ce Que Vous Devez Savoir",
      'imagePath': 'assets/blog_images/homepage-concept-with-search-bar.jpg',
      'text':
          "Dans cet article, nous partageons les dernières techniques de SEO pour aider votre site web à se classer plus haut dans les résultats de recherche en 2024. De l'optimisation des mots-clés à l'amélioration de la vitesse de chargement, nous couvrons tout.",
      'boldTextList': [''],
      'date': '07/06/2024'
    },
    {
      'id': 4,
      'title':
          "Interview avec Notre Expert en UX/UI : L'Importance d'une Bonne Expérience Utilisateur",
      'imagePath':
          'assets/blog_images/ui-ux-design-informations-actualites.jpg',
      'text':
          "Plongez dans l'importance de l'expérience utilisateur avec notre expert en UX/UI, qui partage ses idées sur les meilleures pratiques et les tendances à suivre pour créer des interfaces intuitives et engageantes",
      'boldTextList': [''],
      'date': '08/06/2024'
    },
    {
      'id': 5,
      'title':
          "10 Meilleures Pratiques pour Optimiser les Performances de Votre Site Web",
      'imagePath':
          'assets/blog_images/18627-INF_KAN_PROD_APRIL_MEA-article_solution-ETL_website-2-18627-INF_KAN_PROD_APRIL_MEA-article_solution-ETL_website-2-1.jpg',
      'text':
          "Apprenez comment améliorer les performances de votre site web avec ces 10 meilleures pratiques, incluant l'optimisation des images, l'utilisation de CDN et bien plus.",
      'boldTextList': [''],
      'date': '09/06/2024'
    },
    {
      'id': 6,
      'title': "Les Dernières Tendances en Développement Web et Mobile en 2024",
      'imagePath': 'assets/blog_images/last_dev_tech_used.jpg',
      'text':
          "Explorez les nouvelles tendances en développement web et mobile qui marqueront 2024, et comment votre entreprise peut en tirer parti.",
      'boldTextList': [''],
      'date': '10/06/2024'
    },
  ];

  @override
  List<BlogPost> getAllBlogPosts() {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");

    return blogPosts.map((item) {
      return BlogPost(
          item["id"],
          item["title"],
          item["description"],
          dateFormat.parse(item["creationDate"]),
          item["content"],
          item["author"]);
    }).toList();
  }
}
