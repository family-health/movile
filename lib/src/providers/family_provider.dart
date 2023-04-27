import 'package:app/src/models/family.dart';
import 'package:get/get.dart';
import 'package:app/src/environment/environment.dart';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/utils/toast_alert.dart';

class FamilyProvider extends GetConnect {
  String url = "${Environment.API_URL}/api/family";

  Future<ResponseApi> create(Family family, String token) async {
    Response response = await post(
        '$url/create', family.toJsonForCreateFamily(), headers: {
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

  Future<ResponseApi> updateById(Family family, String token, String id) async {
    Response response = await put('$url/$id', family.toJsonForCreateFamily(),
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

  Future<ResponseApi> deleteById(String id, String token) async {
    Response response = await delete('$url/$id', headers: {
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

  Future<ResponseApi> getAllFamilyByUserId(String userId, String token) async {
    Response response = await get('$url/byuserId/$userId', headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    });

    if (response.body == null) {
      Alertas.error('No se pudo obtener la informacion');
      return ResponseApi();
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }

    Future<ResponseApi> getOneFamilyId(String id, String token) async {
    Response response = await get('$url/$id', headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    });

    if (response.body == null) {
      Alertas.error('No se pudo obtener la informacion');
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
