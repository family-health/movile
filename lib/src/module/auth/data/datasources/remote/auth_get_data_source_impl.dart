import 'package:app/src/@core/errors/failures.dart';
import 'package:app/src/module/auth/auth_module.dart';
import 'package:app/src/module/auth/data/models/user_model.dart';
import 'package:app/src/@core/models/response_api_model.dart';
import 'package:get/get.dart';

class AuthGetDataSource extends GetConnect implements IAuthRemoteDataSource {
  @override
  void onInit() {
    super.onInit();
    // httpClient.defaultDecoder = CasesModel.fromJson;
    // httpClient.baseUrl = "${API.API_URL}/api/auth";
    httpClient.baseUrl = "http://192.168.0.159:3000/api/auth";

    httpClient.addRequestModifier<Map<String, dynamic>?>((request) {
      request.headers['Content-Type'] = 'application/json';
      return request;
    });
  }

  @override
  Future<UserModel> loginWithEmailAndPassword(LoginParams params) async {
    try {
      Response response = await post("http://192.168.100.15:3000/api/auth/signin", {"email": params.email, "password": params.password});
      ResponseApiModel<LoginResponseModel> body = ResponseApiModel(
        success: response.body["success"],
        message: response.body["message"],
        data: (response.body["data"] == null) ? null : LoginResponseModel.fromJson(response.body["data"]),
      );
      return UserModel.fromLoginRespondeModel(body.data!);
      // return UserModel.fromJson(body.data!.toJson());
    } catch (e) {
      throw ServerFailure();
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