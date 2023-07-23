import 'package:app/src/module/auth/presentation/ui/register_email_screen.dart';
import 'package:get/get.dart';

class RegisterScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    printInfo(info: "Testing RegisterScreenController");
  }

  void navigateToRegisterEmailScreen(){
    Get.to(const RegisterEmailScreen());
  }

  void test(){}
  
  void navigateToLoginScreen() {
    Get.back();
  }
}
