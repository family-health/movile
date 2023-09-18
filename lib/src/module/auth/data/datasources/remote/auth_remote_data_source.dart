import 'package:app/src/module/auth/data/models/auth_response_model.dart';
import 'package:app/src/module/auth/data/models/token_model.dart';
import 'package:app/src/module/auth/data/models/user_model.dart';
import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:app/src/module/auth/domain/usecases/register_with_email_usecase.dart';

abstract class IAuthRemoteDataSource {
  IAuthRemoteDataSource();

  Future<AuthResponseModel<UserModel, TokenModel>> login(LoginParams params);

  Future<AuthResponseModel<UserModel, TokenModel>> register(RegisterParams params);
}
