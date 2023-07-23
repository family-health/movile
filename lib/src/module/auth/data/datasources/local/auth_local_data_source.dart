import 'package:app/src/module/auth/data/models/user_model.dart';

abstract class IAuthLocalDataSource {
  UserModel? readUser();
  Future<void> updateUser(Map<String,dynamic> json);
  Future<void> removeUser();
}