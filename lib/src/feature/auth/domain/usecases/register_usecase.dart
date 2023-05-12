import 'package:dartz/dartz.dart';
import 'package:app/src/feature/auth/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

    Future<Either<dynamic,dynamic>> call() async {
    return await repository.register();
  }
}
