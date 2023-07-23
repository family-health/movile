import 'package:app/src/module/auth/presentation/logic/login_navigation_controller.dart';
import 'package:app/src/module/auth/presentation/logic/login_email_controller.dart';
import 'package:app/src/module/auth/presentation/logic/login_apple_controller.dart';
import 'package:app/src/module/auth/presentation/logic/login_facebook_controller.dart';
import 'package:app/src/module/auth/presentation/logic/login_google_controller.dart';
import 'package:get/get.dart';

export 'package:app/src/module/auth/presentation/logic/login_navigation_controller.dart';
export 'package:app/src/module/auth/presentation/logic/login_email_controller.dart';
export 'package:app/src/module/auth/presentation/logic/login_facebook_controller.dart';
export 'package:app/src/module/auth/presentation/logic/login_apple_controller.dart';
export 'package:app/src/module/auth/presentation/logic/login_google_controller.dart';

class LoginController extends GetxController {
  final LoginNavigationController loginNavigationController = Get.find();
  final LoginEmailController loginEmailController = Get.find();
  final LoginFacebookController loginFacebookController = Get.find();
  final LoginGoogleController loginGoogleController = Get.find();
  final LoginAppleController loginAppleController = Get.find();

  @override
  void onClose() {
    super.onClose();
    loginNavigationController.dispose();
    loginEmailController.dispose();
    loginFacebookController.dispose();
    loginGoogleController.dispose();
    loginAppleController.dispose();
  }
}