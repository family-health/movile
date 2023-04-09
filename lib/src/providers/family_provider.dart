import 'package:app/src/models/family.dart';
import 'package:get/get.dart';
import 'package:app/src/environment/environment.dart';
import 'package:app/src/models/responseApi.dart';

class FamilyProvider extends GetConnect {
  String url = "${Environment.API_URL}/api/family";

  Future<ResponseApi> create(Family family, String token) async {
    Response response = await post(
        '$url/create', family.toJsonForCreateFamily(), headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo actualizar la informacion');
      return ResponseApi();
    }

    if (response.statusCode == 401) {
      Get.snackbar('Error', 'No estas autorizado para realizar esta peticion');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }
}
