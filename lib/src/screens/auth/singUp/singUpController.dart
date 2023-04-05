// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:app/src/utils/snackbar_util.dart';
import 'package:app/src/utils/environment.dart';



class SingUpController extends GetxController {
  final String url = "${Environment.API_URL}/api/v1/auth";

  final singnInFormKey = GlobalKey<FormState>();
  final singnUpFormKey = GlobalKey<FormState>();

  late TextEditingController nameTextEditingController =
      TextEditingController();
  late TextEditingController usernameTextEditingController =
      TextEditingController();
  late TextEditingController emailTextEditingController =
      TextEditingController();
  late TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();
    usernameTextEditingController = TextEditingController();
    nameTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    usernameTextEditingController.dispose();
    nameTextEditingController.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
  }

  void signIn() async {
    final dio = Dio();

    try {
      final response = await dio.post('$url/signin', data: {
        "username": usernameTextEditingController.value.text,
        "password": passwordTextEditingController.value.text
      });
      GetStorage box = GetStorage();
      box.write("token", response.data["access_token"]);
      Get.toNamed('/tabulator');
    } catch (e) {
      printError(info: 'error: $e');
    }
  }

  void signUp() async {
    singnUpFormKey.currentState?.validate();
    final dio = Dio();

    try {
      final response = await dio.post('$url/signup', data: {
        "name": nameTextEditingController.value.text,
        "username": usernameTextEditingController.value.text,
        "email": emailTextEditingController,
        "password": passwordTextEditingController.value.text,
        "avatar": null,
      });

      Map<int, String> codeMessages = {
        201: "Usuario creado con exito",
        500: "Hubo un error al crear usuario.",
      };

      switch (response.statusCode) {
        case 201:
          signIn();
          break;
        case 500:
          SnackbarUtil()
              .showSnackbar(Get.context!, codeMessages[response.statusCode]!);
          break;
      }
    } catch (e) {
      printError(info: "$e");
      SnackbarUtil().showSnackbar(Get.context!, "Error 500");
    }
  }

  void logout() async {
    GetStorage box = GetStorage();
    box.remove("token");
    Get.toNamed('/auth/signin');
  }
}
