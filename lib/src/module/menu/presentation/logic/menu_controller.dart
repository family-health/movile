import 'package:app/src/shared/routes/routes_deprecated.dart';
import 'package:get/get.dart';
import 'package:app/src/shared/utilities/toaster_alert.dart';

class MenuController extends GetxController {
  Future<void> singOut() async {
    await alertDialogRemoveSesion(
        'Confirmación', "¿Estás seguro de que deseas cerrar sesión?");
  }

  void goToProfileInfo() {
    Get.toNamed(ROUTES.ROUTE_SETTINGS_PROFILE_INFO);
  }
}
