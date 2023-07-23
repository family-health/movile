import 'package:app/src/module/auth/presentation/ui/register_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterFormController extends GetxController {
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController(); 
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController passwordRepeatTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController = TextEditingController();
  TextEditingController genereTextEditingController = TextEditingController();

  void navigateToRegisterSteps() {
    Get.to(const RegisterEmailScreen());
  }
}