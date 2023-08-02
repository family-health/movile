import 'dart:async';

import 'package:app/src/@core/exception/exceptions.dart';
import 'package:app/src/@core/exception/failures.dart';
import 'package:app/src/module/auth/auth_module.dart';
import 'package:app/src/module/auth/data/models/user_model.dart';
import 'package:app/src/module/common/data/models/response_api_model.dart';
import 'package:app/src/module/auth/domain/errors/auth_exception.dart';
import 'package:app/src/shared/utilities/environment.dart';
import 'package:get/get.dart';

class AuthGetDataSource extends GetConnect implements IAuthRemoteDataSource {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Environment.apiBaseUrl;
    httpClient.addRequestModifier<Map<String, dynamic>?>((request) {
      request.headers['Content-Type'] = 'application/json';
      return request;
    });
  }

  @override
  Future<UserModel> loginWithEmailAndPassword(LoginParams params) async {
    try {
      Response response = await post("${Environment.apiBaseUrl}/api/auth/signin", {"email": params.email, "password": params.password});
      
      if (response.statusCode == 201) {
        ResponseApiModel<LoginResponseModel> body = ResponseApiModel<LoginResponseModel>(
          success: response.body["success"],
          message: response.body["message"],
          data: (response.body["data"] == null) ? null : LoginResponseModel.fromJson(response.body["data"]),
        );
        return UserModel.fromLoginRespondeModel(body.data!);
      } else if (response.statusCode == 400) {
        throw AuthException();
      } else if (response.statusCode == 401) {
        throw AuthException();
      } else {
        throw ServerException();
      }
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserModel> registerWithEmailAndPassword(RegisterParams params) async {
    // Register data = const Register(username: "josephdgb1996@gmail.com", password: "123456789");
    try {
      // Response<ResponseApiModel<User>> response = await post("${httpClient.baseUrl}/sigin", params);
      return const UserModel(id: 'id', name: 'name', lastname: 'lastname', email: 'email', phone: 'phone');
      // return response.body.data;
    } catch (e) {
      throw ServerFailure();
    }
  }
}
