import 'package:app/src/@core/error/exceptions.dart';
// import 'package:app/src/module/auth/data/models/token_model.dart';
import 'package:app/src/module/auth/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app/src/module/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:app/src/@core/resources/storage/storage_config.dart';

class AuthLocalDataSource implements IAuthLocalDataSource {
  final _storage = GetStorage();

  @override
  UserModel? readUser() {
    try {
      Map<String, dynamic>? user = _storage.read(Storage.user);
      return (user == null) ? null : UserModel.fromJson(user);
    } catch (e) {
      throw CacheException("Error to read user storage");
    }
  }

  @override
  Future<void> updateUser(Map<String, dynamic> json) {
    try {
      return _storage.write(Storage.user, json);
    } catch (e) {
      throw CacheException("Error to write user in the storage");
    }
  }

  @override
  Future<void> removeUser() {
    return _storage.remove(Storage.user);
  }

  @override
  String? readToken() {
    try {
      return _storage.read("token");
    } catch (e) {
      throw CacheException("Message");
    }
  }

  @override
  Future<void> updateToken(String token) {
    try {
      return _storage.write("token", token);
    } catch (e) {
      throw CacheException("Message");
    }
  }

  @override
  Future<void> removeToken() {
    return _storage.remove("token");
  }
}
