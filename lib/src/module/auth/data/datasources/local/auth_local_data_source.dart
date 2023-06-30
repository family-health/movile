abstract class IAuthLocalDataSource {
  Future<dynamic> setLoginCached();
  Future<dynamic> getLoginCached();
}