import 'package:app/src/module/auth/presentation/logic/login_controller.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/forgot_password.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/input.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/small_button.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/submit.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/text_divider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/index.dart' as widgets;


class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _LoginHeader(),
          Expanded(child: _LoginContent()),
          _LoginBottom(),
        ]),
      ),
    );
  }
}

class _LoginHeader extends LoginScreen {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    return const widgets.LayoutHeader(
      image: "assets/images/auth/auth-login.png",
      title: "Hi, Welcome Back!",
      subtitle: "Login to track your health data with us",
    );
  }
}

class _LoginContent extends LoginScreen{
  const _LoginContent();

  @override
  Widget build(BuildContext context) {
    LoginEmailController loginEmailController = controller.loginEmailController;
    LoginFacebookController loginFacebookController = controller.loginFacebookController;
    LoginGoogleController loginGoogleController = controller.loginGoogleController;
    LoginAppleController loginAppleController = controller.loginAppleController;

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Input(controller: loginEmailController.emailTextEditingController, hintText: "example@domain.com", obscureText: false),
          Input(controller: loginEmailController.passwordTextEditingController, hintText: "*********", obscureText: true),
          const Align(alignment: Alignment.centerRight, child: ForgotPassword()),
          Submit(onPressed: loginEmailController.submit, label: "Submit"),
          const TextDivider(text: "Or"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmallButton(image: "assets/images/auth/facebook-black.png", onPressed: loginFacebookController.submit),
              const SizedBox(width: 10.0),
              SmallButton(image: "assets/images/auth/google-black.png", onPressed: loginGoogleController.submit),
              const SizedBox(width: 10.0),
              SmallButton(image: "assets/images/auth/apple-black.png", onPressed: loginAppleController.submit),
            ],
          ),
        ]),
      ),
    );
  }
}

class _LoginBottom extends LoginScreen {
  const _LoginBottom();

  @override
  Widget build(BuildContext context) {
    LoginNavigationController loginNavigationController = controller.loginNavigationController;

    return widgets.LayoutBottom(
      text: "Don't have an account?",
      span: "Register",
      onTap: loginNavigationController.navigateToRegisterScreen,
    );
  }
}