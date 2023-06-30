import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:app/src/module/auth/domain/usecases/register_with_email_usecase.dart';
import 'package:app/src/shared/domain/entities/user.dart';

abstract class IAuthRemoteDataSource {
  Future<User> login(LoginParams params);
  Future<User> register(RegisterParams params);
}