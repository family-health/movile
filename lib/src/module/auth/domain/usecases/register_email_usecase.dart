import 'package:dartz/dartz.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/module/auth/domain/entities/register.dart';

class RegisterEmailUsecase {
  final AuthRepository repository;

  RegisterEmailUsecase(this.repository);

  Future<Either<dynamic, dynamic>> call(Register register) async {
    return await repository.register(register);
  }
}