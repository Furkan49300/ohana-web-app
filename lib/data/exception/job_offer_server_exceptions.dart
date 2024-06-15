class JobOfferServerException implements Exception {
  final String message;

  JobOfferServerException(this.message);

  @override
  String toString() => message;
}
