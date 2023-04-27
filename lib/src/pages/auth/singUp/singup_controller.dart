import 'dart:convert';
import 'dart:io';

import 'package:app/src/environment/environment.dart';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/providers/user_provider.dart';
import 'package:app/src/utils/toast_alert.dart';
import 'package:app/src/utils/validate_inputs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

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

    if (imageFile == null) {
      Alertas.warning("La foto es requerida");
    } else {
      if (isValidRegisterForm(
          email, password, repeactPassword, name, lastName, phone)) {
        progressDialog.show(max: 10, msg: "Registrando usuario ...");
        User user = User(
            email: email,
            lastname: lastName,
            name: name,
            password: password,
            phone: phone);

        Stream stream = await _userProvider.createWithImage(user, imageFile!);
        stream.listen((res) {
          progressDialog.close();
          ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));

          if (responseApi.success == true) {
            GetStorage().write(Environment.USER_STORAGE,
                responseApi.data); // DATOS DEL USUARIO EN SESION
            goToHomePage();
            progressDialog.close();
          } else {
            Alertas.error(responseApi.message ?? "Hubo un error");
            progressDialog.close();
          }
        });

        progressDialog.close();
      }
    }
  }

  void goToHomePage() {
    Get.offNamedUntil(Environment.ROUTE_HOME, (route) => false);
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
