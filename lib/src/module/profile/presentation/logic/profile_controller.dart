import 'package:app/src/module/profile/data/models/user_model_old.dart';
import 'package:app/src/shared/utilities/toaster_alert.dart';
import 'package:app/src/shared/config/routes_deprecated.dart';
import 'package:app/src/shared/config/storage_deprecated.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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