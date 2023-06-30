// ignore_for_file: avoid_print

import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginFormController extends GetxController with StateMixin {

  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController(); 
  TextEditingController passwordTextEditingController = TextEditingController();

  LoginWithEmailUsecase loginWithEmailUsecase = Get.find();

  @override
  void onInit() {
    super.onInit();
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

  // RxStatus status = RxStatus.empty();


}