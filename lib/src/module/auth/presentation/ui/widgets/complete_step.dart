import 'package:app/src/module/auth/presentation/logic/create_account_controller.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/index.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/form_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteStep extends GetView<CreateAccountController> {
  const CompleteStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormHeader(title: "Complete", subtitle: "Complete your login info"),
        const SizedBox(height: 15.0),
        AuthTextFormField(hintText: "example@domain.com", obscureText: false, onChanged: controller.updateEmail),
        AuthTextFormField(hintText: "**********", obscureText: true, onChanged: controller.updatePassword),
        AuthTextFormField(hintText: "**********", obscureText: true, onChanged: controller.updateRepeatPassword),
    ],);
  }
}