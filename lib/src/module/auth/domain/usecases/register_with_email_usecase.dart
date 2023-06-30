import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';

class RegisterWithEmailUsecase {
  final IAuthRepository repository;

  RegisterWithEmailUsecase(this.repository);

  Future<Either<dynamic, dynamic>> call(RegisterParams params) async {
    return await repository.register(params);
  }
}

class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String name;
  final String lastname;
  final String phone;
  final String avatar;

  const RegisterParams({
    required this.email,
    required this.password,
    required this.name,
    required this.lastname,
    required this.phone,
    required this.avatar,
  });

  @override
  List<Object?> get props => [email, password, name, lastname, phone, avatar];
}