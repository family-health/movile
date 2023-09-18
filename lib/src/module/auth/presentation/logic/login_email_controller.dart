// ignore_for_file: avoid_print

import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/@core/resources/router/routes_config.dart';
import 'package:app/src/@core/utilities/snackbar.dart';
import 'package:app/src/shared/presentation/logic/app_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class LoginEmailController extends GetxController {
  EmailStatus emailStatus = EmailStatus.unknown;
  PasswordStatus passwordStatus = PasswordStatus.unknown;
  FormStatus formStatus = FormStatus.initial;

  Email? email;
  Password? password;

  void updateEmail(String value) {
    try {
      email = Email((emailBuilder) => emailBuilder..value = value);
      emailStatus = EmailStatus.valid;
      update();
    } on ArgumentError {
      emailStatus = EmailStatus.invalid;
      update();
    }
  }

  void updatePassword(String value) {
    try {
      password = Password((passwordBuilder) => passwordBuilder..value = value);
      passwordStatus = PasswordStatus.valid;
      update();
    } on ArgumentError {
      passwordStatus = PasswordStatus.invalid;
      update();
    }
  }

  void submit() async {
    bool emailCheck = !(emailStatus == EmailStatus.valid);
    bool passwordCheck = !(passwordStatus == PasswordStatus.valid);

    if (emailCheck || passwordCheck) {
      formStatus = FormStatus.initial;
      return;
    }

    formStatus = FormStatus.loading;
    update();

    LoginWithEmailUsecase loginWithEmailUsecase = Get.find();
    Either<Failure, User> usecaseResponse = await loginWithEmailUsecase(LoginParams(email: email!.value, password: password!.value));
    
    usecaseResponse.fold((failure) async {
      if (failure is ServerFailure) {
        Snackbar().error(failure.title, failure.message);
        formStatus = FormStatus.failure;
        update();
      } else if (failure is SocketFailure) {
        await Future.delayed(const Duration(seconds: 3));
        Snackbar().error(failure.title, failure.message);
        formStatus = FormStatus.failure;
        update();
      }
    }, (user) {
        AppController appController = Get.find<AppController>();
        appController.reload();

        Get.offAllNamed(Routes.main);
        formStatus = FormStatus.success;
        update();
    });
  }
}