import 'package:app/src/models/user.dart';
import 'package:get/get.dart';
import 'package:app/src/environment/environment.dart';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/utils/toast_alert.dart';

class UserProvider extends GetConnect {
  String url = "${Environment.API_URL}/api/auth";
  String urlUser = "${Environment.API_URL}/api/user";

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post(
        "$url/signin", {'email': email, 'password': password},
        headers: {'Content-Type': 'application/json'});

    if (response.body == null) {
      Alertas.error("Hubo un error en la petición");
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

  // ⁡⁣⁣⁡⁢⁢⁢crear usuario sin imagen⁡⁡
  Future<ResponseApi> create(User user) async {
    Response response = await post("$url/signup", user.toJsonForCreate(),
        headers: {'Content-Type': 'application/json'});
    if (response.body == null) {
      Alertas.error("Hubo un error en la petición");
      return ResponseApi();
    }
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

  // ⁡⁢⁢⁢actualizar usurio sin imagen⁡⁡⁡
  Future<ResponseApi> updateWithOutImage(
      User user, String idUser, String token) async {
    Response response = await put(
        '$urlUser/withOutImage/$idUser', user.toJsonForUpdateWithOutImage(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $token"
        }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Alertas.error('No se pudo actualizar la informacion');
      return ResponseApi();
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }
}
