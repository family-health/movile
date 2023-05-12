// import 'package:app/src/common/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<dynamic,dynamic>> login();
  Future<Either<dynamic,dynamic>> register();
}