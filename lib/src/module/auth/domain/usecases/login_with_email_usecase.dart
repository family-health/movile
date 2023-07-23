import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:app/src/module/common/domain/usecases/usecase.dart';
import 'package:app/src/@core/errors/failures.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/module/auth/domain/entities/user.dart';

class LoginWithEmailUsecase implements UseCase<User, LoginParams> {
  final IAuthRepository repository;

  LoginWithEmailUsecase(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    try {
      return await repository.login(params);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}