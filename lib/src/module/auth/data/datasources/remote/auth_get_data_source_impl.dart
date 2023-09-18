import 'package:app/src/module/auth/data/models/auth_response_model.dart';
import 'package:app/src/module/auth/data/models/token_model.dart';
import 'package:get/get.dart';
import 'package:app/src/@core/error/exceptions.dart';
import 'package:app/src/@core/utilities/environment.dart';

import 'package:app/src/module/auth/data/models/user_model.dart';
import 'package:app/src/shared/data/models/api/response_api_model.dart';
import 'package:app/src/module/auth/data/models/register_response_model.dart';
import 'package:app/src/module/auth/data/datasources/remote/auth_remote_data_source.dart';

import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:app/src/module/auth/domain/usecases/register_with_email_usecase.dart';

class AuthGetDataSource implements IAuthRemoteDataSource {
  final GetConnect connect = GetConnect();

  AuthGetDataSource() {
    connect.baseUrl = Environment.apiBaseUrl;
  }

  @override
  Future<AuthResponseModel<UserModel, TokenModel>> login(LoginParams params) async {
    try {
      Response response = await connect.post("/api/auth/signin", {"email": params.email, "password": params.password});

      
      if (response.statusCode == 201) {
        TokenModel tokenModel = TokenModel(response.body["data"]["token"]);
        UserModel userModel = UserModel.fromJson(response.body["data"]);
        return AuthResponseModel(token: tokenModel, user: userModel);
      } else if (response.statusCode == 400) {
        throw ServerException("Wrong email or password format");
      } else if (response.statusCode == 401) {
        throw ServerException("Wrong credentials, please check again");
      } else {
        throw SocketException("Server lost conection");
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<AuthResponseModel<UserModel, TokenModel>> register(RegisterParams params) async {
    try {
      Response response = await connect.post("/api/auth/signup", {
        "email": params.email,
        "password": params.password,
        "name": params.name,
        "lastname": params.lastname,
        "phone": params.phone,
        "gender": params.gender,
        "avatar": params.avatar,
        "height": params.height,
        "weight": params.weight,
        "birth": params.birth.toString(),
      });

      ResponseApiModel<RegisterResponseModel> registerResponseModel = ResponseApiModel<RegisterResponseModel>(
        success: response.body["success"],
        message: response.body["message"],
        data: (response.body["data"] == null) ? null : RegisterResponseModel.fromJson(response.body["data"]),
      );

      if (response.statusCode == 201) {
        TokenModel tokenModel = TokenModel(response.body["data"]["token"]);
        UserModel userModel = UserModel.fromJson(response.body["data"]);
        return AuthResponseModel(token: tokenModel, user: userModel);
        // return UserModel.fromRegisterRespondeModel(registerResponseModel.data!);
      } else if (response.statusCode == 400) {
        throw ServerException(registerResponseModel.message);
      } else {
        throw SocketException("Server lost conection");
      }
    } catch (e) {
      rethrow;
    }
  }
}
