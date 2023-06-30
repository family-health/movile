import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/module/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:app/src/module/auth/data/models/login_response_model.dart';
import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:app/src/module/auth/domain/usecases/register_with_email_usecase.dart';
import 'package:app/src/shared/domain/entities/user.dart';
import 'package:app/src/@core/api/response_api_model.dart';
import 'package:get/get.dart';

class AuthGetDataSource extends GetConnect implements IAuthRemoteDataSource {
 
  @override
  void onInit() {
    super.onInit();
    // httpClient.defaultDecoder = CasesModel.fromJson;
    // httpClient.baseUrl = "${API.API_URL}/api/auth";
    httpClient.baseUrl = "http://192.168.0.159:3000/api/auth";

    httpClient.addRequestModifier<Map<String,dynamic>?>((request) {
      request.headers['Content-Type'] = 'application/json';
      return request;
    });
  }
  
  @override
  Future<User> login(LoginParams params) async {
    try {
      Response response = await post("http://192.168.0.159:3000/api/auth/signin", {"email": params.email, "password": params.password});
      ResponseApiModel<LoginResponseModel> body = ResponseApiModel(
        success: response.body["success"],
        message: response.body["message"],
        data: (response.body["data"] == null) ? null : LoginResponseModel.fromJson(response.body["data"]),
      );
      // ignore: avoid_print
      print(body);
      return const User(name: "Joseph", lastname: "Garcia", email: "josephdgb1996@gmail.com", phone: "+543 978757580");
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<User> register(RegisterParams params) async {
    // Register data = const Register(username: "josephdgb1996@gmail.com", password: "123456789");
    try {
      // Response<ResponseApiModel<User>> response = await post("${httpClient.baseUrl}/sigin", params);
      return const User(email: "test@test.com", lastname: "Garcia", name: "Joseph", phone: "0978757580", avatar: "assets/images/avatars/image.png");
      // return response.body.data;
    } catch (e) {
      throw ServerFailure();
    }
  }
}