import 'package:app/src/module/auth/data/models/user_model.dart';
import 'package:app/src/shared/utilities/toast_alert.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app/src/enum/enum.dart';

class ProfileController extends GetxController {
  var user =
      UserModel.fromJson(GetStorage().read(STORAGE.USER_STORAGE) ?? {}).obs;

  Future<void> singOut() async {
    await alertDialogRemoveSesion(
        'Confirmación', "¿Estás seguro de que deseas cerrar sesión?");
  }

  void goToProfileUpdate() {
    Get.toNamed(ROUTES.ROUTE_SETTINGS_PROFILE_UPDATE);
  }
}