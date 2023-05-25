// ignore_for_file: depend_on_referenced_packages, unused_import

import 'dart:convert';
import 'dart:io';

import 'package:app/src/enum/enum.dart';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/utils/toast_alert.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class UserProvider extends GetConnect {
  String url = "${API.API_URL}/api/auth";
  String urlUser = "${API.API_URL}/api/user";

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

  Future<Stream> createWithImage(User user, File image) async {
    Uri uri = Uri.http(API.API_URL_OLD, '/api/auth/signup-with-image');
    final request = http.MultipartRequest('POST', uri);
    request.files.add(http.MultipartFile(
        'image', http.ByteStream(image.openRead().cast()), await image.length(),
        filename: basename(image.path)));
    request.fields['user'] = json.encode(user.toJsonForCreate());
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
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
