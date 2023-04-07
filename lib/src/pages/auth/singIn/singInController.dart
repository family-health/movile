// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage() {
    Get.toNamed("/auth/signup");
  }
}
