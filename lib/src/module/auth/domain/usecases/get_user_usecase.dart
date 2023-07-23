import 'package:app/src/module/auth/domain/entities/user.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/module/common/domain/usecases/usecases.dart';

class GetUserUsecase implements UseCase<User, NoParams> {
  final IAuthRepository repository;

  GetUserUsecase(this.repository);

  @override
  User? call(NoParams params) {
    try {
      return repository.user;
    } catch (error) {
      throw Exception(error);
    }
  }
}