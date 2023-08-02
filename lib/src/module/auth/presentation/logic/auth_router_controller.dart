import 'package:get/get.dart';

class AuthRouterController extends GetxController {
  void navigateToLoginScreen() {
    Get.toNamed("/auth/login");
  }

  void navigateToRegisterScreen() {
    Get.toNamed("/auth/register");
  }
}
