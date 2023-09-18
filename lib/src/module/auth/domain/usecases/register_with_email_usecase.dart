import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/@core/usecases/usecases.dart';
import 'package:app/src/module/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';

class RegisterWithEmailUsecase implements UseCase<Future<Either<Failure, User>>, RegisterParams> {
  final IAuthRepository repository;

  RegisterWithEmailUsecase(this.repository);

  @override
  Future<Either<Failure, User>> call(RegisterParams params) async {
    return await repository.register(params);
  }
}

class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String name;
  final String lastname;
  final String phone;
  final String gender;
  final String? avatar;
  final double height;
  final double weight;
  final DateTime birth;


  const RegisterParams({
    required this.email,
    required this.password,
    required this.name,
    required this.lastname,
    required this.phone,
    required this.gender,
    this.avatar,
    required this.height,
    required this.weight,
    required this.birth,
  });

  @override
  List<Object?> get props => [email, password, name, lastname, phone, gender, avatar, height, weight, birth];
}