import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  //API
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? "127.0.0.1:3000";

  //Storage
  static String get tokenKey => dotenv.env["TOKEN_KEY"] ?? "token";
  static String get userKey => dotenv.env["USER_KEY"] ?? "user";

  //Routes
  static String get authRoute => dotenv.env["AUTH_ROUTE"] ?? "/auth";
  static String get loginRoute => dotenv.env["LOGIN_ROUTE"] ?? "/auth/login";
  static String get registerRoute => dotenv.env["REGISTER_ROUTE"] ?? "/auth/register";
  static String get homeRoute => dotenv.env["HOME_ROUTE"] ?? "/home";
}