// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:app/src/module/auth/domain/entities/login.dart';

export 'package:get/get.dart';

class SignInFormController extends GetxController with StateMixin<Login> {

  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController(); 
  TextEditingController passwordTextEditingController = TextEditingController(); 

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
    print("Close SignIn Controller");
  }

  void validate(){
    print(validate);
  }
  
  void submit(){
    print(emailTextEditingController.text);
    print(passwordTextEditingController.text);
  }

  // RxStatus status = RxStatus.empty();


}