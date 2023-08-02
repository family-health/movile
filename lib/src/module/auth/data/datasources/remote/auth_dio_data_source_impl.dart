import 'package:app/src/module/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:app/src/module/auth/data/models/user_model.dart';
import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:app/src/module/auth/domain/usecases/register_with_email_usecase.dart';

class AuthDioDataSource implements IAuthRemoteDataSource {
  @override
  Future<UserModel> loginWithEmailAndPassword(LoginParams params) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> registerWithEmailAndPassword(RegisterParams params) {
    throw UnimplementedError();
  }
}