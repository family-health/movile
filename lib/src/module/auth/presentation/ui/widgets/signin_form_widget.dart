import 'package:flutter/material.dart';
import 'package:app/src/module/auth/presentation/logic/signin_form_controller.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/input_widget.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/submit_widget.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/forgot_password.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/login_with_google_widget.dart';

class SignInForm extends GetView<SignInFormController> {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInFormController());

    return const Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _SignInFormInputs(),
          SizedBox(height: 20.0),
          _SignInFormButtons(),
        ],
      ),
    );
  }
}

class _SignInFormInputs extends GetView<SignInFormController> {
  const _SignInFormInputs();

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

class _SignInFormButtons extends GetView<SignInFormController> {
  const _SignInFormButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Submit(onPressed: loginWithEmail, label: "Login"),
        const Padding(padding: EdgeInsets.only(top: 15.0, bottom: 15.0), child: Text("Or Singn in with")),
        LoginWithGoogle(onPressed: loginWithEmail),
      ],
    );
  }

  void loginWithEmail(){}
  void loginWithGoogle(){}
} 