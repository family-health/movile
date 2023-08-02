
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String title;
  final String message;

  const Failure(this.title, this.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.title, super.message);

  @override
  List<Object?> get props => [title, message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.title, super.message);

  @override
  List<Object?> get props => [title, message];
}

class SocketFailure extends Failure {
  const SocketFailure(super.title, super.message);

  @override
  List<Object?> get props => [title, message];
}