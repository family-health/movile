import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/@core/usecases/usecases.dart';

class LogoutUsecase implements UseCase<void, NoParams> {
  final IAuthRepository repository;

  LogoutUsecase(this.repository);

  @override
  Future<void> call(NoParams params) {
    return repository.logout();
  }
}