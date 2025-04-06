// lib/core/error/failures.dart
abstract class Failure implements Exception {
  String? message;
  Failure([this.message]);  // Make the message optional by using square brackets
}

class ServerException extends Failure {
  ServerException([super.message]);
  @override
  String toString() {
    return 'ServerException: $message';
  }
}