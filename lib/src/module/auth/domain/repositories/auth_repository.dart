// import 'package:app/src/common/errors/failures.dart';
import 'package:app/src/module/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/module/auth/domain/entities/register.dart';

abstract class AuthRepository {
  Future<Either<Failure,User>> login(String email, String password);
  Future<Either<Failure,User>> register(Register params);
}