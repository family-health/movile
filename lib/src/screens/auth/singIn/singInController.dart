// ignore_for_file: file_names
import '../singUp/singUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingInController extends GetxController {
  void pushSingUpScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SingnUpScreen()));
  }
}
