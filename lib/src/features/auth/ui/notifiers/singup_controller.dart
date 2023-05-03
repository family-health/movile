import 'package:flutter/material.dart';
import 'package:app/src/features/auth/data/models/user_model.dart';
import 'package:app/src/features/auth/data/sources/user_provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:app/src/common/utilities/validate_inputs.dart';
import 'package:app/src/common/models/response_api.dart';
import 'package:app/src/common/enviroments/environment.dart';
import 'package:app/src/common/utilities/toast_alert.dart';

class SingUpController extends GetxController {
  var obscureTextPassword = true.obs;
  var obscureTextRepeactPassword = true.obs;

  void toggleObscurePaswword() {
    obscureTextPassword.toggle();
  }
  void toggleObscureRepeactPaswword() {
    obscureTextRepeactPassword.toggle();
  }

  final UserProvider _userProvider = UserProvider();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeactPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    repeactPasswordController.dispose();
    nameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
  }

  void register(BuildContext context) async {
    ProgressDialog progressDialog = ProgressDialog(context: context);

    String email = emailController.text.trim();
    String password = passwordController.text;
    String repeactPassword = repeactPasswordController.text;
    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phone = phoneController.text.trim();

    if (isValidRegisterForm(
        email, password, repeactPassword, name, lastName, phone)) {
      progressDialog.show(max: 10, msg: "Registrando usuario ...");
      User user = User(
          email: email,
          lastname: lastName,
          name: name,
          password: password,
          phone: phone);

      ResponseApi responseApi = await _userProvider.create(user);
      progressDialog.close();
      if (responseApi.success == true) {
        GetStorage().write(Environment.USER_STORAGE, responseApi.data);
        progressDialog.close();
        goToHomePage();
      } else {
        Alertas.error(responseApi.message ?? "Hubo un error");
        progressDialog.close();
      }

      progressDialog.close();
    }
  }

  void goToHomePage() {
    Get.offNamedUntil(Environment.ROUTE_HOME, (route) => false);
  }
}
