import 'package:app/src/@core/utilities/environment.dart';
import 'package:app/src/module/family/data/models/family_member_model.dart';
import 'package:app/src/shared/data/models/api/response_api_model.dart';
import 'package:app/src/@core/utilities/toaster_alert.dart';
import 'package:get/get.dart';

class FamilyProvider extends GetConnect {
  String url = "${Environment.apiBaseUrl}/api/family";

  Future<ResponseApiModel> create(FamilyMemberModel family, String token) async {
    Map<String, String> headers = {'Content-Type': 'application/json', 'Authorization': "Bearer $token"};
    Response response = await post('$url/create', family.toJsonForCreateFamily(), headers: headers);

    if (response.body == null) {
      Alertas.error('No se pudo actualizar la informacion');
      return ResponseApiModel(success: false, message: "message", data: null);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApiModel(success: false, message: "message", data: null);
    }

    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);
    return responseApi;
  }

  Future<ResponseApiModel> updateById(FamilyMemberModel family, String token, String id) async {
    Response response = await put('$url/$id', family.toJsonForCreateFamily(),
        headers: {'Content-Type': 'application/json', 'Authorization': "Bearer $token"}); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Alertas.error('No se pudo actualizar la informacion');
      return ResponseApiModel(success: false, message: "message", data: null);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApiModel(success: false, message: "message", data: null);
    }

    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);

    return responseApi;
  }

  Future<ResponseApiModel<dynamic>> deleteById(String id, String token) async {
    Response response = await delete('$url/$id',
        headers: {'Content-Type': 'application/json', 'Authorization': "Bearer $token"}); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Alertas.error('No se pudo actualizar la informacion');
      return ResponseApiModel(success: false, message: "message", data: null);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApiModel(success: false, message: "message", data: null);
    }

    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);

    return responseApi;
  }

  Future<ResponseApiModel<List<dynamic>>> getAllFamilyByUserId(String userId, String token) async {
    Response<Map<String,dynamic>?> response = await get('$url/byuserId/$userId', headers: {'Content-Type': 'application/json', 'Authorization': "Bearer $token"});

    if (response.body == null) {
      Alertas.error('No se pudo obtener la informacion');
      return ResponseApiModel(success: false, message: "message", data: null);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApiModel(success: false, message: "message", data: null);
    }

    return ResponseApiModel<List<dynamic>>.fromJson(response.body!);
  }

  Future<ResponseApiModel> getOneFamilyId(String id, String token) async {
    Response response = await get('$url/$id', headers: {'Content-Type': 'application/json', 'Authorization': "Bearer $token"});

    if (response.body == null) {
      Alertas.error('No se pudo obtener la informacion');
      return ResponseApiModel(success: false, message: "message", data: null);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApiModel(success: false, message: "message", data: null);
    }

    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);

    return responseApi;
  }

  Future<ResponseApiModel> sendInvitation(String email, String token) async {
    Response response = await get('$url/send-invitation/$email', headers: {'Content-Type': 'application/json', 'Authorization': "Bearer $token"});

    if (response.body == null) {
      Alertas.error('No se pudo enviar la inivtacion');
      return ResponseApiModel(success: false, message: "message", data: null);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return ResponseApiModel(success: false, message: "message", data: null);
    }

    Alertas.success('Invitacion enviada correctamente!');

    ResponseApiModel responseApi = ResponseApiModel.fromJson(response.body);

    return responseApi;
  }
}