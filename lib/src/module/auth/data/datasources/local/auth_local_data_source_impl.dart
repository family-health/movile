import 'package:app/src/@core/errors/exceptions.dart';
import 'package:app/src/module/auth/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app/src/module/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:app/src/shared/storage/storage.dart';

class AuthLocalDataSource implements IAuthLocalDataSource {
  final _storage = GetStorage();

  @override
  UserModel? readUser() {
    try {
      Map<String,dynamic>? json = _storage.read(Storage.user);
      return (json == null) ? null : UserModel.fromJson(json);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> updateUser(Map<String, dynamic> json) {
    try {
      return _storage.write(Storage.user, json);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> removeUser() {
    return _storage.remove(Storage.user);
  }
}