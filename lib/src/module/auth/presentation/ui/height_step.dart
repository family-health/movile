import 'package:app/src/module/auth/presentation/logic/create_account_controller.dart';
import 'package:app/src/module/auth/presentation/ui/ui_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeightStep extends GetView<CreateAccountController> {
  const HeightStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormHeader(title: "Height", subtitle: "What is your Height?"),
        const SizedBox(height: 15.0),
        AuthTextFormField(hintText: "180 cm", obscureText: false, keyboardType: TextInputType.number, onChanged: controller.updateHeight),
      ],
    );
  }
}
