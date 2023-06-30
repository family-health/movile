import 'package:app/src/module/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:app/src/module/auth/domain/usecases/register_with_email_usecase.dart';
import 'package:app/src/shared/domain/entities/user.dart';

class AuthDioDataSource implements IAuthRemoteDataSource {
  @override
  Future<User> login(LoginParams params) {
    throw UnimplementedError();
  }

  @override
  Future<User> register(RegisterParams params) {
    throw UnimplementedError();
  }

}