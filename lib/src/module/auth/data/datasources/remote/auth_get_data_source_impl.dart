import 'package:get/get.dart';
import 'package:app/src/@core/error/exceptions.dart';
import 'package:app/src/shared/utilities/environment.dart';

import 'package:app/src/module/auth/data/models/user_model.dart';
import 'package:app/src/module/common/data/models/response_api_model.dart';
import 'package:app/src/module/auth/data/models/login_response_model.dart';
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
  Future<UserModel> loginWithEmailAndPassword(LoginParams params) async {
    try {
      Response response = await connect.post("/api/auth/signin", {"email": params.email, "password": params.password});
      ResponseApiModel<LoginResponseModel> loginResponseModel = ResponseApiModel<LoginResponseModel>(
        success: response.body["success"],
        message: response.body["message"],
        data: (response.body["data"] == null) ? null : LoginResponseModel.fromJson(response.body["data"]),
      );

      if (response.statusCode == 201) {
        return UserModel.fromLoginRespondeModel(loginResponseModel.data!);
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
  Future<UserModel> registerWithEmailAndPassword(RegisterParams params) async {
    try {
      Response response = await connect.post("/api/auth/signup", {
        "email": params.email,
        "password": params.password,
        "name": params.name,
        "lastname": params.lastname,
        "phone": params.phone,
        "avatar": params.avatar,
      });
      ResponseApiModel<RegisterResponseModel> registerResponseModel = ResponseApiModel<RegisterResponseModel>(
        success: response.body["success"],
        message: response.body["message"],
        data: (response.body["data"] == null) ? null : RegisterResponseModel.fromJson(response.body["data"]),
      );

      if (response.statusCode == 201) {
        return UserModel.fromRegisterRespondeModel(registerResponseModel.data!);
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