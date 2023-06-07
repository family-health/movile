import 'package:app/src/module/auth/domain/entities/user.dart';
import 'package:app/src/module/auth/domain/entities/register.dart';

abstract class AuthRemoteDataSource {
  Future<User> login(String email, String password);
  Future<User> register(Register params);
}