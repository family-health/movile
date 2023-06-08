import 'package:flutter/material.dart';

import 'package:app/src/module/auth/presentation/logic/signin_controller.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/widgets.dart' as widgets;


class SignInScreen extends GetView<SignInController>{
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());

    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            widgets.Header(image: "assets/images/auth/login.png", title: "Welcome", subtitle: "Happy to see u again"),
            Expanded(child: widgets.SignInForm()),
            widgets.CreateNewAccount(),
          ],
        ),
      ),
    );
  }

  Widget buildTitlte(){
    TextStyle style = const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Text("Welcome", style: style),
      const Text("to smart tracking health", style: TextStyle(color: Colors.grey)),
    ],);
  }
}