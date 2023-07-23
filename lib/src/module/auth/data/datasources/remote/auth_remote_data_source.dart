import 'package:app/src/module/auth/auth_module.dart';
import 'package:app/src/module/auth/data/models/user_model.dart';

abstract class IAuthRemoteDataSource {
  Future<UserModel> loginWithEmailAndPassword(LoginParams params);
  Future<UserModel> registerWithEmailAndPassword(RegisterParams params);
}