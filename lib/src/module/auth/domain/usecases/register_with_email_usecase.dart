import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/module/auth/domain/entities/register.dart';

class RegisterWithEmailUsecase {
  final AuthRepository repository;

  RegisterWithEmailUsecase(this.repository);

  Future<Either<dynamic, dynamic>> call(Register register) async {
    return await repository.register(register);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  const Params({required this.email, required this.password});

  @override
  List<Object?> get props => throw UnimplementedError();
}