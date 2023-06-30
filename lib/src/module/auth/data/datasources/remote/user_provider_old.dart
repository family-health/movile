// ignore_for_file: depend_on_referenced_packages, unused_import

import 'dart:convert';
import 'dart:io';

import 'package:app/src/@core/enums/enum.dart';
import 'package:app/src/@core/api/response_api_model.dart';
import 'package:app/src/@core/utilities/toast_alert.dart';
import 'package:app/src/module/auth/data/models/user_model_old.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class UserProvider extends GetConnect {
  String url = "${API.API_URL}/api/auth";
  String urlUser = " ${API.API_URL}/api/user";
  

  Future<ResponseApiModel> login(String email, String password) async {
    Response response = await post(
        "https://familyhealth.ddns.net/api/auth/signin", {'email': email, 'password': password},
        headers: {'Content-Type': 'application/json'});

    if (response.body == null) {
      Alertas.error("Hubo un error en la petición");
      return ResponseApiModel(data: [], message: "false", success: false);
    }

    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);
    return responseApi;
  }


  // Future<ResponseApi> login(String email, String password) async {
  //   Response<dynamic> response = await get("https://pokeapi.co/api/v2/pokemon/ditto");
  //   print(response);
  //   ResponseApi responseApi = const ResponseApi(data: null);
  //   return responseApi;
  // }

  // ⁡⁣⁣⁡⁢⁢⁢crear usuario sin imagen⁡⁡
  Future<ResponseApiModel> create(UserModel user) async {
    Response response = await post("$url/signup", user.toJsonForCreate(),
        headers: {'Content-Type': 'application/json'});
    if (response.body == null) {
      Alertas.error("Hubo un error en la petición");
      return ResponseApiModel(data: [], message: "false", success: false);
    }
    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);
    return responseApi;
  }

  Future<Stream> createWithImage(UserModel user, File image) async {
    Uri uri = Uri.https(API.API_URL_OLD, '/api/auth/signup-with-image');
    final request = http.MultipartRequest('POST', uri);
    request.files.add(http.MultipartFile(
        'image', http.ByteStream(image.openRead().cast()), await image.length(),
        filename: basename(image.path)));
    request.fields['user'] = json.encode(user.toJsonForCreate());
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }

  // ⁡⁢⁢⁢actualizar usurio sin imagen⁡⁡⁡
  Future<ResponseApiModel> updateWithOutImage(
      UserModel user, String idUser, String token) async {
    Response response = await put(
        '$urlUser/withOutImage/$idUser', user.toJsonForUpdateWithOutImage(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $token"
        }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA 

    if (response.body == null) {
      Alertas.error('No se pudo actualizar la informacion');
      return ResponseApiModel(data: [], message: "false", success: false);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApiModel(data: [], message: "false", success: false);
    }

    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);

    return responseApi;
  }
}
