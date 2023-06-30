import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';
import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:app/src/module/auth/domain/usecases/register_with_email_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/@core/error/exceptions.dart';
import 'package:app/src/module/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:app/src/module/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:app/src/shared/domain/entities/user.dart';

class AuthRepository implements IAuthRepository {
  final IAuthRemoteDataSource remoteDataSource;
  final IAuthLocalDataSource localDataSource;

  AuthRepository(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, User>> login(LoginParams params) async {
    try {
      User response = await remoteDataSource.login(params);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> register(RegisterParams params) async {
    try {
      User response = await remoteDataSource.register(params);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() {
    throw UnimplementedError();
  }
}