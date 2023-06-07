import 'package:app/src/module/circle/data/models/family.dart';
import 'package:get/get.dart';
import 'package:app/src/shared/utilities/environment.dart';
import 'package:app/src/shared/models/response_api.dart';
import 'package:app/src/shared/utilities/toast_alert.dart';

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
      return const ResponseApi(data: [], message: "false", success: false);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return const ResponseApi(data: [], message: "false", success: false);
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }

  Future<ResponseApi> getAllFamilyByUserId(String userId, String token) async {
    Response response = await get(
        '$url/byuserId/$userId', headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    }); 

    if (response.body == null) {
      Alertas.error('No se pudo obtener la informacion');
      return const ResponseApi(data: [], message: "false", success: false);
    }

    if (response.statusCode == 401) {
      Alertas.error('No estas autorizado para realizar esta peticion');
      return const ResponseApi(data: [], message: "false", success: false);
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }
}
