import 'package:app/src/@core/utilities/environment.dart';

abstract class Routes {
  static String main = Environment.mainRoute;
  static String auth = Environment.authRoute;
  static String login = Environment.loginRoute;
  static String register = Environment.registerRoute;
  static String home = Environment.homeRoute;
}