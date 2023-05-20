import 'package:dartz/dartz.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/module/auth/domain/entities/login.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<Either<dynamic, dynamic>> call(Login login) async {
    return await repository.login(login);
  }
}