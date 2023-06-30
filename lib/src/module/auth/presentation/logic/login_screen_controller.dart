import 'package:get/get.dart';

class LoginScreenController extends GetxController with StateMixin {
  @override
  void onInit() {
    super.onInit();
    printInfo(info: "Testing LoginScreenController");
  }

  void navigateToRegisterScreen(){
    Get.toNamed("/auth/register");
  }
}