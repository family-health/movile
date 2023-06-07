import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/shared/enums/enum.dart';
import 'package:app/src/module/auth/domain/entities/register.dart';
import 'package:app/src/module/auth/domain/entities/user.dart';
import 'package:app/src/shared/models/response_api.dart';
import 'package:app/src/module/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:get/get.dart';

class AuthRemoteDataSourceImplementation extends GetConnect implements AuthRemoteDataSource {
 
  @override
  void onInit() {
    super.onInit();
    // httpClient.defaultDecoder = CasesModel.fromJson;
    httpClient.baseUrl = "${API.API_URL}/api/user";

    httpClient.addRequestModifier<Map<String,dynamic>?>((request) {
      request.headers['Content-Type'] = 'application/json';
      return request;
    });
  }
  
  @override
  Future<User> login(String email, String password) async {
    try {
      Response<ResponseApi<User>> response = await post("${httpClient.baseUrl}/sigin", {email, password});
      return response.body!.data;
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<User> register(Register params) async {
    // Register data = const Register(username: "josephdgb1996@gmail.com", password: "123456789");
    try {
      Response<ResponseApi<User>> response = await post("${httpClient.baseUrl}/sigin", params);
      
      return response.body!.data;
    } catch (e) {
      throw ServerFailure();
    }
  }
}