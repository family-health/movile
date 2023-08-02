import 'package:app/src/module/auth/presentation/logic/create_account_controller.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/index.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/form_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneStep extends GetView<CreateAccountController> {
  const PhoneStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormHeader(title: "Phone", subtitle: "What is your phone contact"),
        const SizedBox(height: 15.0),
        AuthTextFormField(
          hintText: "Phone",
          obscureText: false,
          onChanged: controller.updatePhone,
          keyboardType: TextInputType.phone,
          maxLenght: 10,
        ),
      ],
    );
  }
}
