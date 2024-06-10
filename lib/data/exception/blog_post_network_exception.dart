class BlogPostNetworkException implements Exception {
  final String message;

  BlogPostNetworkException(this.message);

  @override
  String toString() => message;
}
