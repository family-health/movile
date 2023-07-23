import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';


class LoginEmailController extends GetxController {
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController(); 
  TextEditingController passwordTextEditingController = TextEditingController();

  LoginWithEmailUsecase loginWithEmailUsecase = Get.find();

  @override
  void onInit() {
    super.onInit();
    // ignore: avoid_print
    print("Init SignIn Controller");
  }

  @override
  void onClose() {
    super.onClose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
  }

  void validate(){
    print("validate");
  }
  
  void submit(){
    String email = emailTextEditingController.text;
    String password = passwordTextEditingController.text;
    loginWithEmailUsecase(LoginParams(email: email, password: password));
  }
}