import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:app/src/shared/domain/usecases/usecase.dart';
import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/shared/domain/entities/user.dart';


class LoginWithEmailUsecase implements UseCase<User,LoginParams> {
  final IAuthRepository repository;

  LoginWithEmailUsecase(this.repository);

  @override
  Future<Either<Failure,User>> call(LoginParams params) async {
    return await repository.login(params);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}