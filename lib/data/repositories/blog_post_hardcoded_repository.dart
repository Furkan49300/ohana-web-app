import 'package:intl/intl.dart';
import 'package:ohana_webapp_flutter/data/exception/blog_post_network_exception.dart';
import 'package:ohana_webapp_flutter/data/exception/blog_post_server_exception.dart';
import 'dart:async';
import 'dart:math';

import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/entities/blog_post_content.dart';
import 'package:ohana_webapp_flutter/logic/repositories/blog_post_repository.dart';

class BlogPostHardCodedRepository implements BlogPostRepository {
  final Random _random = Random();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
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
  Future<List<BlogPost>> getAllBlogPosts() async {
    // Simule un délai de réseau
    await Future.delayed(const Duration(seconds: 2));

    // Simule une erreur de 20% du temps
    double randomValue = _random.nextDouble();
    if (randomValue < 0.2) {
      throw BlogPostNetworkException('Erreur réseau');
    } else if (randomValue < 0.4) {
      throw BlogPostServerException('Erreur server');
    }

    return blogPosts.map((item) {
      return BlogPost(
          id: item["id"],
          title: item["title"],
          description: item["text"],
          creationDate: dateFormat.parse(item["date"]),
          content: BlogPostContent(item["text"]),
          author: "Zouayobo DALI",
          imagePath: item["imagePath"]);
    }).toList();
  }

  @override
  Future<List<BlogPost>> getMostRecentBlogPosts({required int number}) async {
    List<Map> recentNews = [
      {
        'id': 1,
        'title': 'Optimisation SEO pour les Sites Web en 2024',
        'imagePath': 'assets/blog_images/homepage-concept-with-search-bar.jpg',
        'text':
            "Les dernières techniques de SEO pour aider votre site web à se classer plus haut dans les résultats de recherche",
        'boldTextList': [''],
        'date': '15/06/2024'
      },
      {
        'id': 2,
        'title':
            'Flutter vs React Native : Quelle Technologie Choisir en 2024 ',
        'imagePath':
            'assets/blog_images/representations-user-experience-interface-design.jpg',
        'text':
            "Analyse comparative entre Flutter et React Native, couvrant les performances, la facilité d'utilisation, la communauté et les perspectives d'avenir pour aider les développeurs à faire le bon choix.",
        'boldTextList': [''],
        'date': '10/06/2024'
      },
      {
        'id': 3,
        'title':
            '15 Astuces Indispensables pour Accélérer le Développement Mobile',
        'imagePath':
            'assets/blog_images/businessman-checking-stock-market-online.jpg',
        'text':
            "Découvrez des astuces pratiques pour optimiser votre flux de travail et développer des applications mobiles plus rapidement et plus efficacement",
        'boldTextList': [''],
        'date': '05/06/2024'
      },
      {
        'id': 4,
        'title':
            'Les Meilleures Pratiques pour Sécuriser Votre Application Mobile',
        'imagePath': 'assets/blog_images/iphone1200x628-v4-fr.jpg',
        'text':
            "Guide complet sur les mesures de sécurité à prendre lors du développement d'applications mobiles pour protéger les données des utilisateurs",
        'boldTextList': [''],
        'date': '05/06/2024'
      },
    ];

    // Simule un délai de réseau
    await Future.delayed(const Duration(seconds: 2));

    // Simule une erreur de 20% du temps
    double randomValue = _random.nextDouble();
    if (randomValue < 0.025) {
      throw BlogPostNetworkException('Erreur réseau');
    } else if (randomValue < 0.05) {
      throw BlogPostServerException('Erreur server');
    }

    // Étape 1 : Creer la liste de BlogPost
    List<BlogPost> formatetdRecentNews = blogPosts.map((item) {
      return BlogPost(
          id: item["id"],
          title: item["title"],
          description: item["text"],
          creationDate: dateFormat.parse(item["date"]),
          content: BlogPostContent(item["text"]),
          author: "Zouayobo DALI",
          imagePath: item["imagePath"]);
    }).toList();

    // Étape 2 : Trier la liste par date de manière décroissante
    formatetdRecentNews
        .sort((a, b) => b.creationDate.compareTo(a.creationDate));

    // Étape 3 : Prendre les deux premiers éléments de la liste triée
    List<BlogPost> latestItems = formatetdRecentNews.take(number).toList();

    return latestItems;
  }
}
