import 'package:app/src/module/auth/auth_module.dart';
import 'package:app/src/module/auth/data/models/user_model.dart';
import 'package:app/src/module/auth/domain/errors/auth_exception.dart';
import 'package:app/src/module/auth/domain/errors/auth_failure.dart';
import 'package:dartz/dartz.dart';

import 'package:app/src/@core/exception/failures.dart';
import 'package:app/src/@core/exception/exceptions.dart';
import 'package:app/src/module/auth/domain/entities/user.dart';

class AuthRepository implements IAuthRepository {
  final IAuthRemoteDataSource remoteDataSource;
  final IAuthLocalDataSource localDataSource;

  AuthRepository(this.remoteDataSource, this.localDataSource);

  @override
  User? get storedUser {
    UserModel? storedUser = localDataSource.readUser();
    return (storedUser == null) ? null : storedUser.toEntity();
  }

  @override
  Future<Either<Failure, User>> login(LoginParams params) async {
    try {
      UserModel user = await remoteDataSource.loginWithEmailAndPassword(params);
      localDataSource.updateUser(user.toJson());
      return Right(user.toEntity());
    } on AuthException {
      return Left(AuthFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> register(RegisterParams params) async {
    try {
      UserModel response = await remoteDataSource.registerWithEmailAndPassword(params);
      return Right(response.toEntity());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<void> logout() {
    return localDataSource.removeUser();
  }
}