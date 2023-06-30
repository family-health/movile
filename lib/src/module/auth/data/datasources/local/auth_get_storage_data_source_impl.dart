import 'package:app/src/module/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:app/src/shared/domain/entities/user.dart';
import 'package:get_storage/get_storage.dart';

class AuthGetStorageDataSource implements IAuthLocalDataSource {
  @override
  Future getLoginCached() {
    final box = GetStorage();
    User loggedUser = box.read("loginCached");
    // ignore: avoid_print
    print(loggedUser);
    throw UnimplementedError();
  }
  
  @override
  Future setLoginCached() {
    final box = GetStorage();
    box.write("loginCached", null);
    throw UnimplementedError();
  }
}