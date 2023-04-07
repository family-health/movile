import 'package:app/src/environment/environment.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsMainController extends GetxController {
  void singOut() {
    GetStorage().remove(Environment.USER_STORAGE);
    Get.offNamedUntil(Environment.ROUTE_SING_IN, (route) => false);
  }
}
