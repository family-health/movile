import 'package:app/src/module/auth/domain/entities/user.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/@core/usecases/usecases.dart';

class GetStoredUserUsecase implements UseCase<User?, NoParams> {
  final IAuthRepository repository;

  GetStoredUserUsecase(this.repository);

  @override
  User? call(NoParams params) {
    return repository.storedUser;
  }
}
