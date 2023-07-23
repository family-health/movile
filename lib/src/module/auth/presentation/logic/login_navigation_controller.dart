import 'package:get/get.dart';

class LoginNavigationController extends GetxController with StateMixin {
  @override
  void onInit() {
    super.onInit();
    printInfo(info: "Testing LoginScreenController");
  }

  void navigateToRegisterScreen() {
    Get.toNamed("/auth/register");
  }

  void navigateToForgotPasswordScreen() {
    Get.toNamed("/auth/register");
  }
}
