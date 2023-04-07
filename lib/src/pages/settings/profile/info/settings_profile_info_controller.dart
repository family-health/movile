import 'package:app/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app/src/environment/environment.dart';

class SettingsProfileInfoController extends GetxController {
  var user =
      User.fromJson(GetStorage().read(Environment.USER_STORAGE) ?? {}).obs;

  void singOut() {
    GetStorage().remove(Environment.USER_STORAGE);
    Get.offNamedUntil(Environment.ROUTE_SING_IN, (route) => false);
  }

  void goToProfileUpdate() {
    Get.toNamed(Environment.ROUTE_SETTINGS_PROFILE_UPDATE);
  }
}
