import 'package:app/src/module/auth/auth_module.dart';
import 'package:app/src/module/auth/data/models/user_model.dart';

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
