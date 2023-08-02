import 'package:app/src/shared/utilities/environment.dart';

abstract class Routes {
  static String auth = Environment.authRoute;
  static String login = Environment.loginRoute;
  static String register = Environment.registerRoute;
  static String home = Environment.homeRoute;
}