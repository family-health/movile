import 'package:app/src/feature/auth/data/datasources/auth_local_data_source.dart';

class AuthRemoteImplementWithDio implements AuthLocalDataSource {
  @override
  Future loginCached() {
    throw UnimplementedError();
  }
}