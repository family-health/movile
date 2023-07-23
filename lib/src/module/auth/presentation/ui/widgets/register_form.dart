// ignore: unused_import
import 'package:app/src/module/auth/presentation/ui/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/module/auth/presentation/logic/register_form_controller.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/index.dart';
// todo: work this widget
class RegisterForm extends GetView<RegisterFormController> {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: const Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // _RegisterFormInputs(),
            _RegisterFormButtons(),
          ],
        ),
      ),
    );
  }
}

// ignore: unused_element
class _RegisterFormInputs extends GetView<RegisterFormController> {
  const _RegisterFormInputs();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Input(controller: TextEditingController(), hintText: "example@domain.com", obscureText: false),
        // Input(controller: TextEditingController(), hintText: "************", obscureText: true),
      ],
    );
  }
}

class _RegisterFormButtons extends GetView<RegisterFormController> {
  const _RegisterFormButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Submit(onPressed: controller.navigateToRegisterSteps, label: "Continue"),
        // const TextDivider(text: "Or Sign Up with"),
        ElevatedButton.icon(
          icon: const Icon(Icons.email, size: 40.0),
          onPressed: callback,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10.0),
            backgroundColor: Colors.black,
            minimumSize: const Size.fromHeight(50),
          ),
          label: const Text("Singup with Email"),
        ),
        const SizedBox(height: 15.0,),
        GoogleButton(text:"Singup with Google", onPressed: callback),
      ],
    );
  }

  void callback(){}
} 