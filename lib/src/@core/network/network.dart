import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetoworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImplement implements NetoworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImplement(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}