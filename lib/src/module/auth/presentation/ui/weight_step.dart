import 'package:app/src/module/auth/presentation/logic/create_account_controller.dart';
import 'package:app/src/module/auth/presentation/ui/ui_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeightStep extends GetView<CreateAccountController> {
  const WeightStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormHeader(title: "Weight", subtitle: "What is your Weight?"),
        const SizedBox(height: 15.0),
        AuthTextFormField(hintText: "100 kg", obscureText: false, keyboardType: TextInputType.number, onChanged: controller.updateWeight),
      ],
    );
  }
}
