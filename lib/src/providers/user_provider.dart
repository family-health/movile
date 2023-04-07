import 'package:get/get.dart';
import 'package:app/src/environment/environment.dart';
import 'package:app/src/models/responseApi.dart';

class UserProvider extends GetConnect {
    String url = "${Environment.API_URL}/api/auth";
  Future<ResponseApi> login(String email, String password) async {
    Response response = await post(
        "$url/signin", {'email': email, 'password': password},
        headers: {'Content-Type': 'application/json'});

    if (response.body == null) {
      Get.snackbar("Error", "Hubo un error en la petición");
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }
}
