// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/providers/user_provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:app/src/utils/validate_inputs.dart';
import 'package:app/src/models/responseApi.dart';
import 'package:app/src/environment/environment.dart';

class SingUpController extends GetxController {
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

      progressDialog.show(max: 10, msg: "Autenticando usuario ...");
      ResponseApi responseApi = await _userProvider.create(user);
      progressDialog.close();
      if (responseApi.success == true) {
        GetStorage().write(Environment.USER_STORAGE, responseApi.data);
        goToHomePage();
      } else {
        Get.snackbar("Error!", responseApi.message ?? "Hubo un error");
      }
    }
    progressDialog.close();
  }

  void goToHomePage() {
    Get.offNamedUntil(Environment.ROUTE_HOME, (route) => false);
  }
}
