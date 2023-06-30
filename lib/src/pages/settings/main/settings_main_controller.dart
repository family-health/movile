import 'package:app/src/enum/enum.dart';
import 'package:get/get.dart';
import 'package:app/src/utils/toast_alert.dart';

class SettingsMainController extends GetxController {
  Future<void> singOut() async {
    await alertDialogRemoveSesion(
        'Confirmación', "¿Estás seguro de que deseas cerrar sesión?");
  }

  void goToProfileInfo() {
    Get.toNamed(ROUTES.ROUTE_SETTINGS_PROFILE_INFO);
  }
}
