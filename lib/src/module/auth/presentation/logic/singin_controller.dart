import 'package:app/src/module/auth/data/datasources/remote/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:app/src/shared/utilities/validate_inputs.dart';
import 'package:app/src/shared/models/response_api.dart';
import 'package:app/src/shared/utilities/environment.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app/src/shared/utilities/toast_alert.dart';

class SingInController extends GetxController {
  var obscureText = true.obs;

  void toggleObscureText() {
    obscureText.toggle();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserProvider userProvider = UserProvider();
  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login(BuildContext context) async {
    ProgressDialog progressDialog = ProgressDialog(context: context);

    String email = emailController.text.trim();
    String password = passwordController.text;
    if (isValidLoginForm(email, password)) {
      progressDialog.show(max: 10, msg: "Autenticando usuario ...");
      ResponseApi responseApi = await userProvider.login(email, password);
      progressDialog.close();
      if (responseApi.success == true) {
        GetStorage().write(Environment.USER_STORAGE, responseApi.data);
        goToHomePage();
      } else {
        Alertas.error(responseApi.message ?? "datos incorrectos");
      }
    }
  }

  void goToRegisterPage() {
    Get.toNamed(Environment.ROUTE_SING_UP);
  }

  void goToHomePage() {
    Get.offNamedUntil(Environment.ROUTE_HOME, (route) => false);
  }
}
