// ignore_for_file: avoid_print

import 'package:app/src/@core/exception/failures.dart';
import 'package:app/src/module/auth/domain/enums/email_status.dart';
import 'package:app/src/module/auth/domain/enums/form_status.dart';
import 'package:app/src/module/auth/domain/enums/password_status.dart';
import 'package:app/src/module/auth/domain/errors/auth_failure.dart';
import 'package:app/src/module/auth/domain/objects/email.dart';
import 'package:app/src/module/auth/domain/objects/password.dart';
import 'package:app/src/module/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:app/src/shared/utilities/environment.dart';
import 'package:app/src/shared/utilities/snackbar.dart';
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
    } catch (e) {
      emailStatus = EmailStatus.invalid;
      update();
    }
  }

  void updatePassword(String value) {
    try {
      password = Password((passwordBuilder) => passwordBuilder..value = value);
      passwordStatus = PasswordStatus.valid;
      update();
    } catch (e) {
      passwordStatus = PasswordStatus.invalid;
      update();
    }
  }

  void submit() async {
    if (!(emailStatus == EmailStatus.valid) || !(passwordStatus == PasswordStatus.valid)) {
      formStatus = FormStatus.initial;
      return;
    }

    formStatus = FormStatus.loading;
    update();

    LoginWithEmailUsecase loginWithEmailUsecase = Get.find();
    final result = await loginWithEmailUsecase(LoginParams(email: email!.value, password: password!.value));
    result.fold((failure) async {
      if (failure is AuthFailure) {
        Snackbar().error("Authentication", "Wrong credentials, please check and try again");
        formStatus = FormStatus.failure;
        update();
      } else if (failure is ServerFailure) {
        await Future.delayed(const Duration(seconds: 3));
        Snackbar().error("Server", "We are having problems, please try again later");
        formStatus = FormStatus.failure;
        update();
      }
    }, (success) {
        Get.toNamed(Environment.homeRoute);
    });
  }
}
