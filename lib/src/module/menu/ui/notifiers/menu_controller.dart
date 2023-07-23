import 'package:app/src/@core/values/enum.dart';
import 'package:get/get.dart';
import 'package:app/src/@core/utilities/toast_alert.dart';

class MenuController extends GetxController {
  Future<void> singOut() async {
    await alertDialogRemoveSesion(
        'Confirmación', "¿Estás seguro de que deseas cerrar sesión?");
  }

  void goToProfileInfo() {
    Get.toNamed(ROUTES.ROUTE_SETTINGS_PROFILE_INFO);
  }
}
