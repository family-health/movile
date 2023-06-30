
import 'package:equatable/equatable.dart';

///[Failure] is a abstract class to create Failures.

abstract class Failure extends Equatable {}

///[NetworkFailure] is a failure comes 

class NetworkFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}
