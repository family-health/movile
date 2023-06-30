import 'package:get/get.dart';

class RegisterScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    printInfo(info: "Testing RegisterScreenController");
  }
  
  void navigateToLoginScreen() {
    Get.back();
  }
}
