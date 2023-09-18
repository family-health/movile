// import 'package:app/src/module/auth/data/models/token_model.dart';
import 'package:app/src/module/auth/data/models/user_model.dart';

abstract class IAuthLocalDataSource {
  UserModel? readUser();
  Future<void> updateUser(Map<String,dynamic> json);
  Future<void> removeUser();

  String? readToken();
  Future<void> updateToken(String token);
  Future<void> removeToken();
}