import 'package:dartz/dartz.dart';
import 'package:app/src/@core/error/exceptions.dart';
import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/module/auth/data/datasources/auth_local_data_source.dart';
import 'package:app/src/module/auth/data/datasources/auth_remote_data_source.dart';
import 'package:app/src/module/auth/domain/entities/login.dart';
import 'package:app/src/module/auth/domain/entities/register.dart';


class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImplementation(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either> login(Login params) async {
    try {
      dynamic response = await remoteDataSource.login();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either> register(Register params) async {
    try {
      dynamic response = await remoteDataSource.register();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}