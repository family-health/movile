import 'package:app/src/module/auth/presentation/ui/create_account_screen.dart';
import 'package:get/get.dart';

class RegisterRouterController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    printInfo(info: "Testing RegisterScreenController");
  }

  void navigateToCreateAccountScreen(){
    Get.to(const CreateAccountScreen());
  }
  
  void navigateToLoginScreen() {
    Get.back();
  }
}