// ignore_for_file: file_names
import 'package:app/src/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:app/src/utils/validate_inputs.dart';
import 'package:app/src/models/responseApi.dart';
import 'package:app/src/environment/environment.dart';
import 'package:get_storage/get_storage.dart';

class SingInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserProvider userProvider = UserProvider();

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
        Get.snackbar("Error!", responseApi.message ?? "datos incorrectos");
      }
    }
  }

  void goToRegisterPage() {
    Get.toNamed("/auth/signup");
  }

  void goToHomePage() {
    Get.offNamedUntil('/tabulator', (route) => false);
  }
}
