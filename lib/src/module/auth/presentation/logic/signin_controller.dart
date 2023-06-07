// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:app/src/module/auth/domain/entities/login.dart';

class SignInController extends GetxController with StateMixin<Login> {

  @override
  void onInit() {
    super.onInit();
    print("Init SignIn Controller");
  }

  @override
  void onClose() {
    super.onClose();
    print("Close SignIn Controller");
  }
  
  void submit(){
    print("Submit");
  }

  // RxStatus status = RxStatus.empty();


}