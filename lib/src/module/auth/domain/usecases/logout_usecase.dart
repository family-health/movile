import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/shared/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

class LogoutUsecase implements UseCase<void, NoParams> {
  final IAuthRepository authRepository;

  LogoutUsecase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return authRepository.logout();
  }
}