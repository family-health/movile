import 'package:app/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<Either<dynamic,dynamic>> call() async {
    return await repository.login();
  }
}
