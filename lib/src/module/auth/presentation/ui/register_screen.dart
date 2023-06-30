import 'package:app/src/module/auth/domain/entities/header_options.dart';
import 'package:app/src/module/auth/presentation/logic/register_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/index.dart' as widgets;
import 'package:get/get.dart';

class RegisterScreen extends GetView<RegisterScreenController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            widgets.Header(
              image: "assets/images/auth/register.png",
              title: "Register",
              subtitle: "Create a new account with your email",
              options: HeaderOptions(dimension: HeaderDimension.big),
            ),
            const Expanded(child: widgets.RegisterForm()),
            widgets.BottomText(
              text: "Already have account?",
              span: "Login",
              onTap: controller.navigateToLoginScreen,
            ),
          ],
        ),
      ),
    );
  }
}
