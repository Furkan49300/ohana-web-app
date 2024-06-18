import 'package:ohana_webapp_flutter/data/repositories/mock/custom_convertor.dart';
import 'package:ohana_webapp_flutter/data/exception/blog_post_network_exception.dart';
import 'package:ohana_webapp_flutter/data/exception/blog_post_server_exception.dart';
import 'dart:async';
import 'dart:math';

import 'package:ohana_webapp_flutter/logic/entities/blog_post.dart';
import 'package:ohana_webapp_flutter/logic/repositories/blog_post_repository.dart';

class BlogPostHardCodedRepository implements BlogPostRepository {
  final Random _random = Random();
  List<Map> blogPosts = [
    {
      'id': '1',
      'title':
          'Développez Votre Première Application Mobile en Flutter : Un Guide Pas à Pas',
      'image': 'assets/blog_images/flutterCover.webp',
      'description':
          "Ce tutoriel vous guidera à travers le processus de développement d'une application mobile de base avec Flutter, y compris la configuration de l'environnement, la création d'une interface utilisateur et le déploiement de l'application. ",
      "paragraphs": [
        {
          "url_image": "http://ffefr.com",
          "subtitle": "",
          "video": "",
          'text': '''
                            [
                              {"insert": "Flutter Quill Example\\n", "attributes": {"header": 1}},
                              {"insert": "Introduction\\n", "attributes": {"header": 2}},
                              {"insert": "Flutter Quill is a rich text editor for Flutter applications. It provides a user-friendly interface for creating and editing content.\\n"},
                              {"insert": "\\n"},
                              {"insert": "Features\\n", "attributes": {"header": 2}},
                              {"insert": "Here are some of the features provided by Flutter Quill:\\n"},
                              {"insert": "• ", "attributes": {"list": "bullet"}},
                              {"insert": "Rich text formatting (bold, italic, underline)\\n"},
                              {"insert": "• ", "attributes": {"list": "bullet"}},
                              {"insert": "Headers and subheaders\\n"},
                              {"insert": "• ", "attributes": {"list": "bullet"}},
                              {"insert": "Lists (ordered and unordered)\\n"},
                              {"insert": "• ", "attributes": {"list": "bullet"}},
                              {"insert": "Links and images\\n"},
                              {"insert": "• ", "attributes": {"list": "bullet"}},
                              {"insert": "Embeds (videos, tweets, etc.)\\n"},
                              {"insert": "\\n"},
                              {"insert": "Example Usage\\n", "attributes": {"header": 2}},
                              {"insert": "\\n"},
                              {"insert": "Below is an example of how you can use Flutter Quill in your Flutter application:\\n"},
                              {"insert": "1. Add the flutter_quill package to your pubspec.yaml file:\\n", "attributes": {"list": "ordered"}},
                              {"insert": "```yaml\\ndependencies:\\n  flutter:\\n    sdk: flutter\\n  flutter_quill: ^2.0.0\\n```\\n"},
                              {"insert": "2. Import the package in your Dart file:\\n", "attributes": {"list": "ordered"}},
                              {"insert": "```dart\\nimport 'package:flutter_quill/flutter_quill.dart' as quill;\\n```\\n"},
                              {"insert": "3. Initialize a QuillController with your content:\\n", "attributes": {"list": "ordered"}},
                              {"insert": "```dart\\nfinal document = quill.Document.fromJson(jsonDecode(jsonString));\\nfinal controller = quill.QuillController(document: document, selection: TextSelection.collapsed(offset: 0));\\n```\\n "},
                              {"insert": "4. Use the QuillEditor widget to display the editor:\\n", "attributes": {"list": "ordered"}},
                              {"insert": "```dart\\nquill.QuillEditor.basic(controller: controller, readOnly: false);\\n```\\n"},
                              {"insert": "\\n"},
                              {"insert": "Conclusion\\n", "attributes": {"header": 2}},
                              {"insert": "\\n"},
                              {"insert": "Flutter Quill is a powerful and flexible rich text editor that can help you build great user experiences in your Flutter applications. Whether you need to create a simple note-taking app or a full-featured content management system, Flutter Quill has you covered.\\n"},
                              {"insert": "\\n"},
                              {"insert": "For more information, visit the ", "attributes": {"italic": true}},
                              {"insert": "Flutter Quill GitHub repository", "attributes": {"italic": true, "link": "https://github.com/singerdmx/flutter-quill"}},
                              {"insert": ".\\n"}
                            ]
    ''',
        },
        {
          "url_image": "http://ffefr.com",
          "subtitle": "",
          "video": "",
          'text': r'''
                      [
                        {"insert": "Advanced Features", "attributes": {"header": 2}},
                        {"insert": "\\n"},
                        {"insert": "In addition to the basic features, Flutter Quill also offers some advanced capabilities:\n"},
                        {"insert": "• ", "attributes": {"list": "bullet"}},
                        {"insert": "Custom text styling with attributes like color and font size\n"},
                        {"insert": "• ", "attributes": {"list": "bullet"}},
                        {"insert": "Table support for organizing data\n"},
                        {"insert": "• ", "attributes": {"list": "bullet"}},
                        {"insert": "Undo/redo functionality for editing history\n"},
                        {"insert": "\\n"},
                        {"insert": "Example Application\n", "attributes": {"header": 2}},
                        {"insert": "Let's create a simple note-taking app using Flutter Quill:\n"},
                        {"insert": "1. Define a QuillEditor widget in your app's UI:\n", "attributes": {"list": "ordered"}},
                        {"insert": "```dart\nquill.QuillEditor.basic(controller: controller, readOnly: false);\\n```\\n"},
                        {"insert": "2. Implement save and load functions to store user notes:\n", "attributes": {"list": "ordered"}},
                        {"insert": "```dart\nvoid saveNote(Document document) {\n  // Save document to local storage\n}\n\nDocument loadNote() {\n  // Load document from local storage\n}\n```\\n"},
                        {"insert": "3. Integrate the Quill package into your app's dependencies:\n", "attributes": {"list": "ordered"}},
                        {"insert": "```yaml dependencies:   flutter:    sdk: flutter ,  flutter_quill: ^2.0.0```"},
                        {"insert": "\\n"},
                        {"insert": "Conclusion\n", "attributes": {"header": 2}},
                        {"insert": "With its advanced features and ease of integration, Flutter Quill is a top choice for developers looking to add rich text editing capabilities to their Flutter apps. Start building your next great app with Flutter Quill today!\n"},
                        {"insert": "\\n"},
                        {"insert": "For more information, check out the ", "attributes": {"italic": true}},
                        {"insert": "official documentation", "attributes": {"italic": true, "link": "https://docs.flutter.dev/packages/flutter_quill"}},
                        {"insert": ".\n"}
                    ]
    ''',
        }
      ],
      'date': '05/06/2024'
    },
    {
      'id': '2',
      'title':
          "Étude de Cas : Réussite de la Transformation Numérique de l'Entreprise ABC",
      'image': 'assets/blog_images/UnArticleABC-720x544.png',
      'description':
          "Découvrez comment nous avons aidé l'entreprise ABC à transformer son site web en une plateforme numérique moderne, en améliorant l'expérience utilisateur et en augmentant les conversions de 30%.",
      "paragraphs": [
        {
          "url_image": "http://ffefr.com",
          "subtitle": "",
          "video": "",
          'text': r'''
                              [
                                {"insert": "Étude de Cas : Réussite de la Transformation Numérique de l'Entreprise ABC\n", "attributes": {"header": 1}},
                                {"insert": "Introduction\n", "attributes": {"header": 2}},
                                {"insert": "L'entreprise ABC a entrepris une transformation numérique complète afin de moderniser ses opérations et améliorer l'expérience client. Voici un aperçu de leur parcours et des résultats obtenus.\n"},
                                {"insert": "\n"},
                                {"insert": "Objectifs\n", "attributes": {"header": 2}},
                                {"insert": "• ", "attributes": {"list": "bullet"}},
                                {"insert": "Moderniser les systèmes internes\n"},
                                {"insert": "• ", "attributes": {"list": "bullet"}},
                                {"insert": "Améliorer l'expérience client\n"},
                                {"insert": "• ", "attributes": {"list": "bullet"}},
                                {"insert": "Augmenter l'efficacité opérationnelle\n"},
                                {"insert": "\n"},
                                {"insert": "Résultats\n", "attributes": {"header": 2}},
                                {"insert": "L'entreprise ABC a réussi à réduire les coûts de 20% et à augmenter la satisfaction client de 15% grâce à des systèmes plus rapides et plus fiables.\n"}
                              ]
    ''',
        }
      ],
      'date': '06/06/2024'
    },
    {
      'id': '3',
      'title':
          "Optimisation SEO pour les Sites Web en 2024 : Ce Que Vous Devez Savoir",
      'image': 'assets/blog_images/homepage-concept-with-search-bar.jpg',
      'description':
          "Dans cet article, nous partageons les dernières techniques de SEO pour aider votre site web à se classer plus haut dans les résultats de recherche en 2024. De l'optimisation des mots-clés à l'amélioration de la vitesse de chargement, nous couvrons tout.",
      "paragraphs": [
        {
          "url_image": "http://ffefr.com",
          "subtitle": "",
          "video": "",
          'text': r'''
                        [
                          {"insert": "Optimisation SEO pour les Sites Web en 2024 : Ce Que Vous Devez Savoir\n", "attributes": {"header": 1}},
                          {"insert": "Introduction\n", "attributes": {"header": 2}},
                          {"insert": "Le SEO est en constante évolution. En 2024, certaines pratiques deviennent cruciales pour maintenir et améliorer votre classement sur les moteurs de recherche.\n"},
                          {"insert": "\n"},
                          {"insert": "Nouvelles Pratiques SEO\n", "attributes": {"header": 2}},
                          {"insert": "• ", "attributes": {"list": "bullet"}},
                          {"insert": "Optimisation pour la recherche vocale\n"},
                          {"insert": "• ", "attributes": {"list": "bullet"}},
                          {"insert": "Utilisation accrue de l'intelligence artificielle\n"},
                          {"insert": "• ", "attributes": {"list": "bullet"}},
                          {"insert": "Priorisation de l'expérience utilisateur\n"},
                          {"insert": "\n"},
                          {"insert": "Conclusion\n", "attributes": {"header": 2}},
                          {"insert": "Pour rester compétitif, il est essentiel de suivre ces tendances et d'adapter vos stratégies SEO en conséquence.\n"}
                        ]
    ''',
        }
      ],
      'date': '07/06/2024'
    },
    {
      'id': '4',
      'title':
          "Interview avec Notre Expert en UX/UI : L'Importance d'une Bonne Expérience Utilisateur",
      'image': 'assets/blog_images/ui-ux-design-informations-actualites.jpg',
      'description':
          "Plongez dans l'importance de l'expérience utilisateur avec notre expert en UX/UI, qui partage ses idées sur les meilleures pratiques et les tendances à suivre pour créer des interfaces intuitives et engageantes",
      'date': '08/06/2024',
      "paragraphs": [
        {
          "url_image": "http://ffefr.com",
          "subtitle": "",
          "video": "",
          'text': r'''
                                              [
                        {"insert": "Interview avec Notre Expert en UX/UI : L'Importance d'une Bonne Expérience Utilisateur\n", "attributes": {"header": 1}},
                        {"insert": "Introduction\n", "attributes": {"header": 2}},
                        {"insert": "Nous avons eu le plaisir de discuter avec notre expert en UX/UI sur les éléments clés qui composent une bonne expérience utilisateur.\n"},
                        {"insert": "\n"},
                        {"insert": "Questions et Réponses\n", "attributes": {"header": 2}},
                        {"insert": "Q: Pourquoi l'expérience utilisateur est-elle si importante?\n", "attributes": {"bold": true}},
                        {"insert": "R: Une bonne expérience utilisateur peut significativement augmenter la satisfaction et la fidélité des utilisateurs.\n"},
                        {"insert": "Q: Quels sont les principaux éléments à considérer?\n", "attributes": {"bold": true}},
                        {"insert": "R: La simplicité, l'accessibilité, et l'interactivité sont essentiels.\n"},
                        {"insert": "\n"},
                        {"insert": "Conclusion\n", "attributes": {"header": 2}},
                        {"insert": "Investir dans une bonne UX/UI est crucial pour le succès à long terme de toute application ou site web.\n"}
                      ]
    ''',
        }
      ],
    },
    {
      'id': '5',
      'title':
          "10 Meilleures Pratiques pour Optimiser les Performances de Votre Site Web",
      'image':
          'assets/blog_images/18627-INF_KAN_PROD_APRIL_MEA-article_solution-ETL_website-2-18627-INF_KAN_PROD_APRIL_MEA-article_solution-ETL_website-2-1.jpg',
      'description':
          "Apprenez comment améliorer les performances de votre site web avec ces 10 meilleures pratiques, incluant l'optimisation des images, l'utilisation de CDN et bien plus.",
      "paragraphs": [
        {
          "url_image": "http://ffefr.com",
          "subtitle": "",
          "video": "",
          'text': r'''
                                              [
                        {"insert": "10 Meilleures Pratiques pour Optimiser les Performances de Votre Site Web\n", "attributes": {"header": 1}},
                        {"insert": "Introduction\n", "attributes": {"header": 2}},
                        {"insert": "L'optimisation des performances de votre site web est cruciale pour offrir une expérience utilisateur fluide et rapide. Voici les meilleures pratiques à suivre.\n"},
                        {"insert": "\n"},
                        {"insert": "Meilleures Pratiques\n", "attributes": {"header": 2}},
                        {"insert": "1. Minimisez les fichiers CSS et JavaScript\n", "attributes": {"list": "ordered"}},
                        {"insert": "2. Utilisez la mise en cache du navigateur\n", "attributes": {"list": "ordered"}},
                        {"insert": "3. Optimisez les images\n", "attributes": {"list": "ordered"}},
                        {"insert": "4. Utilisez un CDN (Content Delivery Network)\n", "attributes": {"list": "ordered"}},
                        {"insert": "5. Activez la compression Gzip\n", "attributes": {"list": "ordered"}},
                        {"insert": "6. Réduisez les requêtes HTTP\n", "attributes": {"list": "ordered"}},
                        {"insert": "7. Chargez les ressources de manière asynchrone\n", "attributes": {"list": "ordered"}},
                        {"insert": "8. Utilisez des polices web performantes\n", "attributes": {"list": "ordered"}},
                        {"insert": "9. Optimisez le temps de réponse du serveur\n", "attributes": {"list": "ordered"}},
                        {"insert": "10. Effectuez des tests de performance réguliers\n", "attributes": {"list": "ordered"}},
                        {"insert": "\n"},
                        {"insert": "Conclusion\n", "attributes": {"header": 2}},
                        {"insert": "En suivant ces meilleures pratiques, vous pouvez considérablement améliorer les performances de votre site web et offrir une expérience utilisateur exceptionnelle.\n"}
                      ]
    ''',
        }
      ],
      'date': '09/06/2024'
    },
    {
      'id': '6',
      'title': "Les Dernières Tendances en Développement Web et Mobile en 2024",
      'image': 'assets/blog_images/last_dev_tech_used.jpg',
      'description':
          "Explorez les nouvelles tendances en développement web et mobile qui marqueront 2024, et comment votre entreprise peut en tirer parti.",
      "paragraphs": [
        {
          "url_image": "http://ffefr.com",
          "subtitle": "",
          "video": "",
          'text': r'''
                    [
                      {"insert": "Les Dernières Tendances en Développement Web et Mobile en 2024\n", "attributes": {"header": 1}},
                      {"insert": "Introduction\n", "attributes": {"header": 2}},
                      {"insert": "En 2024, le développement web et mobile continue d'évoluer à un rythme rapide. Voici les tendances les plus marquantes de cette année.\n"},
                      {"insert": "\n"},
                      {"insert": "Tendances en Développement Web\n", "attributes": {"header": 2}},
                      {"insert": "• ", "attributes": {"list": "bullet"}},
                      {"insert": "Progressive Web Apps (PWA)\n"},
                      {"insert": "• ", "attributes": {"list": "bullet"}},
                      {"insert": "Single Page Applications (SPA)\n"},
                      {"insert": "• ", "attributes": {"list": "bullet"}},
                      {"insert": "Frameworks JavaScript modernes (React, Vue, Angular)\n"},
                      {"insert": "\n"},
                      {"insert": "Tendances en Développement Mobile\n", "attributes": {"header": 2}},
                      {"insert": "• ", "attributes": {"list": "bullet"}},
                      {"insert": "Applications hybrides avec Flutter\n"},
                      {"insert": "• ", "attributes": {"list": "bullet"}},
                      {"insert": "Utilisation accrue de l'IA et du ML\n"},
                      {"insert": "• ", "attributes": {"list": "bullet"}},
                      {"insert": "Intégration de la réalité augmentée (AR)\n"},
                      {"insert": "\n"},
                      {"insert": "Conclusion\n", "attributes": {"header": 2}},
                      {"insert": "Pour rester compétitif, il est crucial de suivre ces tendances et d'adapter vos compétences et vos projets en conséquence.\n"}
                    ]
    ''',
        },
        {
          "url_image": "http://ffefr.com",
          "subtitle": "",
          "video": "",
          'text': r'''
                [
                    {"insert": "Nouveaux Défis et Opportunités en Développement Web et Mobile\n", "attributes": {"header": 1}},
                    {"insert": "Introduction\n", "attributes": {"header": 2}},
                    {"insert": "L'évolution rapide du développement web et mobile en 2024 présente de nouveaux défis et opportunités pour les développeurs. Découvrez les tendances clés de cette année.\n"},
                    {"insert": "\n"},
                    {"insert": "Tendances en Développement Web\n", "attributes": {"header": 2}},
                    {"insert": "• ", "attributes": {"list": "bullet"}},
                    {"insert": "Microfrontends pour une architecture frontale modulaire\n"},
                    {"insert": "• ", "attributes": {"list": "bullet"}},
                    {"insert": "Adoption généralisée des applications sans serveur (Serverless)\n"},
                    {"insert": "• ", "attributes": {"list": "bullet"}},
                    {"insert": "Émergence des architectures de type JAMstack (JavaScript, APIs, Markup)\n"},
                    {"insert": "\n"},
                    {"insert": "Tendances en Développement Mobile\n", "attributes": {"header": 2}},
                    {"insert": "• ", "attributes": {"list": "bullet"}},
                    {"insert": "Intégration croissante de la technologie de la blockchain dans les applications mobiles\n"},
                    {"insert": "• ", "attributes": {"list": "bullet"}},
                    {"insert": "Utilisation de l'apprentissage fédéré pour la confidentialité des données dans les applications mobiles\n"},
                    {"insert": "• ", "attributes": {"list": "bullet"}},
                    {"insert": "Adoption des applications instantanées pour une expérience utilisateur fluide\n"},
                    {"insert": "\n"},
                    {"insert": "Conclusion\n", "attributes": {"header": 2}},
                    {"insert": "Pour réussir dans le paysage concurrentiel du développement web et mobile, il est essentiel de comprendre et d'intégrer ces tendances émergentes dans vos projets et vos compétences.\n"}
                ]
    ''',
        },
        {
          "url_image": "http://ffefr.com",
          "subtitle": "",
          "video": "",
          'text': r'''
                  [
                      {"insert": "Défis Futurs et Innovations en Développement Web et Mobile\n", "attributes": {"header": 1}},
                      {"insert": "Nouveaux Horizons\n", "attributes": {"header": 2}},
                      {"insert": "Alors que nous entrons dans une ère de transformations numériques, les défis et les opportunités dans le domaine du développement web et mobile sont plus prometteurs que jamais. Explorez les perspectives émergentes qui façonneront l'avenir de ces secteurs.\n"},
                      {"insert": "\n"},
                      {"insert": "Évolution du Développement Web\n", "attributes": {"header": 2}},
                      {"insert": "• ", "attributes": {"list": "bullet"}},
                      {"insert": "Adoption accrue des technologies de réalité virtuelle et augmentée pour les interfaces web\n"},
                      {"insert": "• ", "attributes": {"list": "bullet"}},
                      {"insert": "Explosion des applications de commerce électronique basées sur la technologie de la blockchain\n"},
                      {"insert": "• ", "attributes": {"list": "bullet"}},
                      {"insert": "Essor des sites web progressifs basés sur le contenu généré par l'utilisateur\n"},
                      {"insert": "\n"},
                      {"insert": "Innovations en Développement Mobile\n", "attributes": {"header": 2}},
                      {"insert": "• ", "attributes": {"list": "bullet"}},
                      {"insert": "Intégration de l'intelligence artificielle pour une personnalisation avancée des applications mobiles\n"},
                      {"insert": "• ", "attributes": {"list": "bullet"}},
                      {"insert": "Expansion des applications de santé et de bien-être exploitant les capteurs et les données biométriques\n"},
                      {"insert": "• ", "attributes": {"list": "bullet"}},
                      {"insert": "Développement de l'Internet des Objets (IoT) pour une connectivité omniprésente\n"},
                      {"insert": "\n"},
                      {"insert": "Perspectives\n", "attributes": {"header": 2}},
                      {"insert": "Pour prospérer dans l'ère numérique en constante évolution, il est impératif de rester à l'avant-garde de ces tendances émergentes et de cultiver une culture d'innovation continue dans vos pratiques de développement.\n"}
                  ]
    ''',
        }
      ],
      'date': '10/06/2024'
    },
  ];
//ALL BLOG

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
      return jsonToBlogPost(item);
    }).toList();
  }

//MOST RECENT BLOG

  @override
  Future<List<BlogPost>> getMostRecentBlogPosts({required int number}) async {
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
      return jsonToBlogPost(item);
    }).toList();

    // Étape 2 : Trier la liste par date de manière décroissante
    formatetdRecentNews
        .sort((a, b) => b.creationDate.compareTo(a.creationDate));

    // Étape 3 : Prendre les deux premiers éléments de la liste triée
    List<BlogPost> latestItems = formatetdRecentNews.take(number).toList();

    return latestItems;
  }

//GET SPECIFIC BLOG

  @override
  Future<BlogPost> getSingleBlogPost({required String id}) async {
    Map specificBlog = {};
    for (Map item in blogPosts) {
      if (item.containsValue(id)) {
        specificBlog = item;
      }
    }
    return jsonToBlogPost(specificBlog);
  }

  // GET FIRST PAGE
  @override
  Future<List<BlogPost>> getFirstBlogPostsPage() {
    // TODO: implement getFirstBlogPostsPage
    throw UnimplementedError();
  }

  @override
  Future<List<BlogPost>> getNextBlogPostsPage(String lastDocumentId) {
    // TODO: implement getNextBlogPostsPage
    throw UnimplementedError();
  }

  @override
  Future<List<BlogPost>> getPreviousBlogPostsPage(String firstDocumentId) {
    // TODO: implement getPreviousBlogPostsPage
    throw UnimplementedError();
  }

  @override
  Future<List<BlogPost>> getNthBlogPostsPage(nPage) {
    // TODO: implement getNthBlogPostsPage
    throw UnimplementedError();
  }

  @override
  Future<int> getNumberOfBlogPostsPage() {
    // TODO: implement getNumberOfBlogPosts
    throw UnimplementedError();
  }
}
