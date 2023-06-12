import 'package:flutter/material.dart';

import 'package:app/src/module/auth/presentation/logic/signin_form_controller.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/widgets.dart' as widgets;


class SignInScreen extends GetView<SignInFormController>{
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInFormController());

    return const SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              widgets.Header(image: "assets/images/auth/login.png", title: "Welcome", subtitle: "Happy to see u again"),
              Expanded(child: widgets.SignInForm()),
              widgets.CreateNewAccount(),
            ],
          )),
    );
  }
}