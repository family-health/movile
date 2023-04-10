import 'package:app/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app/src/environment/environment.dart';
import 'package:app/src/utils/toast_alert.dart';

class SettingsProfileInfoController extends GetxController {
  var user =
      User.fromJson(GetStorage().read(Environment.USER_STORAGE) ?? {}).obs;

  Future<void> singOut() async {
    await alertDialogRemoveSesion(
        'Confirmación', "¿Estás seguro de que deseas cerrar sesión?");
  }

  void goToProfileUpdate() {
    Get.toNamed(Environment.ROUTE_SETTINGS_PROFILE_UPDATE);
  }
}
