// import 'package:app/src/common/errors/failures.dart';
import 'package:app/src/module/auth/domain/entities/user.dart';
import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:app/src/module/auth/domain/usecases/register_with_email_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:app/src/@core/error/failures.dart';

abstract class IAuthRepository {
  User? get storedUser;
  String? get storedToken;

  Future<Either<Failure, User>> login(LoginParams params);
  Future<Either<Failure, User>> register(RegisterParams params);
  Future<void> logout();
}