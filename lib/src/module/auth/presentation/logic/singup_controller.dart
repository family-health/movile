import 'dart:io';
import 'package:app/src/shared/enums/enum.dart';
import 'package:app/src/module/auth/data/datasources/remote/user_provider.dart';
import 'package:app/src/module/auth/data/models/user_model.dart';
import 'package:app/src/shared/models/response_api.dart';
import 'package:app/src/shared/utilities/toast_alert.dart';
import 'package:app/src/shared/utilities/validate_inputs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import 'package:image_picker/image_picker.dart';

class SingUpController extends GetxController {
  var obscureTextPassword = true.obs;
  var obscureTextRepeactPassword = true.obs;

  ImagePicker picker = ImagePicker();
  File? imageFile;

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
      UserModel user = UserModel(
          email: email,
          lastname: lastName,
          name: name,
          password: password,
          phone: phone);

      ResponseApi responseApi = await _userProvider.create(user);
      progressDialog.close();
      if (responseApi.success == true) {
        GetStorage().write(STORAGE.USER_STORAGE, responseApi.data);
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
    Get.offNamedUntil(ROUTES.ROUTE_HOME, (route) => false);
  }

  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.gallery);
        },
        child: const Text(
          'GALERIA',
          style: TextStyle(color: Colors.black),
        ));
    Widget cameraButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.camera);
        },
        child: const Text(
          'CAMARA',
          style: TextStyle(color: Colors.black),
        ));

    AlertDialog alertDialog = AlertDialog(
      title: const Text('Selecciona una opcion'),
      actions: [galleryButton, cameraButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
