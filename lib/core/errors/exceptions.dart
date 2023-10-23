class ServerException implements Exception {
  ServerException({
    required this.message,
    this.customStatusCode,
  });

  final String message;
  final String? customStatusCode;
}
