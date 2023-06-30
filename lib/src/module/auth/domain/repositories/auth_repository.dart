// import 'package:app/src/common/errors/failures.dart';
import 'package:app/src/module/auth/domain/usecases/usecases.dart';
import 'package:app/src/shared/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:app/src/@core/error/failures.dart';

abstract class IAuthRepository {
  Future<Either<Failure, User>> login(LoginParams params);
  Future<Either<Failure, User>> register(RegisterParams params);
  Future<Either<Failure, void>> logout();
}
