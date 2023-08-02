import 'package:app/src/module/auth/data/models/user_model.dart';
import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:app/src/module/auth/domain/usecases/register_with_email_usecase.dart';

abstract class IAuthRemoteDataSource {
  IAuthRemoteDataSource();

  Future<UserModel> loginWithEmailAndPassword(LoginParams params);
  Future<UserModel> registerWithEmailAndPassword(RegisterParams params);
}