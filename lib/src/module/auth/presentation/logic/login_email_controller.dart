import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';

enum Gender { male, female }

class LoginEmailController extends GetxController {
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  
  final Rx<Gender> _genderObs = Gender.male.obs; 
  Gender get gender => _genderObs.value;
  set gender(Gender gender) => _genderObs.value = gender;

  @override
  void onClose() {
    super.onClose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
  }

  void validateForm() {
    // ignore: avoid_print
    print("validate");
  }

  Future<void> submit() async {
    LoginWithEmailUsecase loginWithEmailUsecase = Get.find();

    String email = emailTextEditingController.text;
    String password = passwordTextEditingController.text;
    try {
      await loginWithEmailUsecase(LoginParams(email: email, password: password));
      Get.toNamed("/home");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
