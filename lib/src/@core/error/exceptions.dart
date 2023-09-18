class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}

class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class SocketException implements Exception {
  final String message;

  SocketException(this.message);
}

class DependencyException implements Exception {
  final String message;

  DependencyException(this.message);
}
