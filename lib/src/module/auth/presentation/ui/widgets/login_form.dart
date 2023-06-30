// ignore_for_file: avoid_print

import 'package:app/src/module/auth/presentation/ui/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:app/src/module/auth/presentation/logic/login_form_controller.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/input.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/submit.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/forgot_password.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/google_button.dart';
import 'package:get/get.dart';

class LoginForm extends GetView<LoginFormController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: const Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _LoginFormInputs(),
            SizedBox(height: 20.0),
            _LoginFormButtons(),
          ],
        ),
      ),
    );
  }
}

class _LoginFormInputs extends GetView<LoginFormController> {
  const _LoginFormInputs();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
          Input(controller: controller.emailTextEditingController, hintText: "example@domain.com", obscureText: false),
          Input(controller: controller.passwordTextEditingController, hintText: "************", obscureText: true),
          const Align(alignment: Alignment.centerRight, child: ForgotPassword()),
    ],);
  }

  void navigateToRecoverPasswordScreen(){}
}

class _LoginFormButtons extends GetView<LoginFormController> {
  const _LoginFormButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Submit(onPressed: loginWithEmail, label: "Login"),
        // const Padding(padding: EdgeInsets.only(top: 15.0, bottom: 15.0), child: Text("Or Signin with")),
        const TextDivider(text: "Or Signin with"),
        GoogleButton(text: "Signin with Google", onPressed: loginWithEmail),
      ],
    );
  }

  void loginWithEmail(){
    controller.submit();
  }

  void loginWithGoogle(){}
} 