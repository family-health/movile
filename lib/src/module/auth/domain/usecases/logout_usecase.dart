import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/module/common/domain/usecases/usecases.dart';

class LogoutUsecase implements UseCase<void, NoParams> {
  final IAuthRepository authRepository;

  LogoutUsecase(this.authRepository);

  @override
  Future<void> call(NoParams params) {
    return authRepository.logout();
  }
}