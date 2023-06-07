import 'package:dartz/dartz.dart';
import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/@core/error/exceptions.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/module/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:app/src/module/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:app/src/module/auth/domain/entities/user.dart';
import 'package:app/src/module/auth/domain/entities/register.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImplementation(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      User response = await remoteDataSource.login(email, password);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> register(Register params) async {
    try {
      User response = await remoteDataSource.register(params);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
