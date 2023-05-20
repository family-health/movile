// import 'package:app/src/common/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:app/src/module/auth/domain/entities/register.dart';
import 'package:app/src/module/auth/domain/entities/login.dart';

abstract class AuthRepository {
  Future<Either<dynamic,dynamic>> login(Login params);
  Future<Either<dynamic,dynamic>> register(Register params);
}