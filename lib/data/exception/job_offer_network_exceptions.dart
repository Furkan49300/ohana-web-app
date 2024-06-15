class JobOfferNetworkException implements Exception {
  final String message;

  JobOfferNetworkException(this.message);

  @override
  String toString() => message;
}
