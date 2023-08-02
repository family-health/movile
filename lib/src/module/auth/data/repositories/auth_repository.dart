import 'package:dartz/dartz.dart';
import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/@core/error/exceptions.dart';

import 'package:app/src/module/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:app/src/module/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:app/src/module/auth/data/models/user_model.dart';

import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:app/src/module/auth/domain/usecases/register_with_email_usecase.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
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
    } on SocketException catch (e) {
      return Left(SocketFailure("Server Connection", e.message));
    } on ServerException catch (e) {
      return Left(SocketFailure("Authentication", e.message));
    }
  }

  @override
  Future<Either<Failure, User>> register(RegisterParams params) async {
    try {
      UserModel user = await remoteDataSource.registerWithEmailAndPassword(params);
      localDataSource.updateUser(user.toJson());
      return Right(user.toEntity());
    } on SocketException catch(e) {
      return Left(SocketFailure("Server Connection", e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure("Register", e.message));
    }
  }

  @override
  Future<void> logout() {
    return localDataSource.removeUser();
  }
}
