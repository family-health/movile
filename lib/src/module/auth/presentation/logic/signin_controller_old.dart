import 'package:app/src/module/auth/data/datasources/remote/user_provider_old.dart';
import 'package:app/src/@core/api/response_api_model.dart';
import 'package:app/src/@core/utilities/validate_inputs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:app/src/@core/enums/enum.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app/src/@core/utilities/toast_alert.dart';

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
      ResponseApiModel responseApi = await userProvider.login(email, password);
      progressDialog.close();
      if (responseApi.success == true) {
        GetStorage().write(STORAGE.USER_STORAGE, responseApi.data);
        goToHomePage();
      } else {
        Alertas.error(responseApi.message);
      }
    }
  }

  void goToRegisterPage() {
    Get.toNamed(ROUTES.ROUTE_SING_UP);
  }

  void goToHomePage() {
    Get.offNamedUntil(ROUTES.ROUTE_HOME, (route) => false);
  }
}
