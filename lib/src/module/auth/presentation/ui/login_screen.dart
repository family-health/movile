import 'package:app/src/module/auth/presentation/logic/login_screen_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/index.dart' as widgets;


class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const widgets.Header(
              image: "assets/images/auth/login.png",
              title: "Login",
              subtitle: "Welcome, sign in to continue",
            ),
            const Expanded(child: widgets.LoginForm()),
            widgets.BottomText(
              text: "Don't have an account?",
              span: "Register",
              onTap: controller.navigateToRegisterScreen,
            ),
          ],
        ),
      ),
    );
  }
}
