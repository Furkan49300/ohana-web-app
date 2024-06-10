class BlogPostServerException implements Exception {
  final String message;

  BlogPostServerException(this.message);

  @override
  String toString() => message;
}
