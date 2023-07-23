import 'package:app/src/module/family/data/models/family.dart';
import 'package:app/src/@core/models/response_api_model.dart';
import 'package:app/src/@core/utilities/toast_alert.dart';
import 'package:get/get.dart';
import 'package:app/src/@core/values/enum.dart';

class FamilyProvider extends GetConnect {
  String url = "${API.API_URL}/api/family";

  Future<ResponseApiModel> create(Family family, String token) async {
    Response response = await post(
        '$url/create', family.toJsonForCreateFamily(), headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Alertas.error('No se pudo actualizar la informacion');
      return ResponseApiModel(success: false, message:"message", data: null);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApiModel(success: false, message:"message", data: null);
    }

    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);

    return responseApi;
  }

  Future<ResponseApiModel> updateById(Family family, String token, String id) async {
    Response response = await put('$url/$id', family.toJsonForCreateFamily(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $token"
        }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Alertas.error('No se pudo actualizar la informacion');
      return ResponseApiModel(success:false, message:"message", data: null);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApiModel(success: false, message:"message", data: null);
    }

    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);

    return responseApi;
  }

  Future<ResponseApiModel<dynamic>> deleteById(String id, String token) async {
    Response response = await delete('$url/$id', headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Alertas.error('No se pudo actualizar la informacion');
      return ResponseApiModel(success:false, message: "message", data: null);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApiModel(success:false, message: "message", data: null);
    }

    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);

    return responseApi;
  }

  Future<ResponseApiModel> getAllFamilyByUserId(String userId, String token) async {
    Response response = await get('$url/byuserId/$userId', headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    });

    if (response.body == null) {
      Alertas.error('No se pudo obtener la informacion');
      return ResponseApiModel(success:false, message: "message", data: null);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApiModel(success:false, message: "message", data: null);
    }

    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);

    return responseApi;
  }

  Future<ResponseApiModel> getOneFamilyId(String id, String token) async {
    Response response = await get('$url/$id', headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    });

    if (response.body == null) {
      Alertas.error('No se pudo obtener la informacion');
      return ResponseApiModel(success:false, message: "message", data: null);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApiModel(success:false, message: "message", data: null);
    }

    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);

    return responseApi;
  }

  Future<ResponseApiModel> sendInvitation(String email, String token) async {
    Response response = await get('$url/send-invitation/$email', headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    });

    if (response.body == null) {
      Alertas.error('No se pudo enviar la inivtacion');
      return ResponseApiModel(success:false, message: "message", data: null);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApiModel(success:false, message: "message", data: null);
    }

    Alertas.success('Invitacion enviada correctamente!');

    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);

    return responseApi;
  }
}