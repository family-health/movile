import 'package:dartz/dartz.dart';
import 'package:app/src/@core/errors/exceptions.dart';
import 'package:app/src/@core/errors/failures.dart';
import 'package:app/src/feature/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:app/src/feature/auth/data/datasources/auth_remote_data_source.dart';


class AuthRepositoryImplement implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImplement(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either> login() async {
    try {
      dynamic response = await remoteDataSource.login();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either> register() async {
    try {
      dynamic response = await remoteDataSource.register();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}