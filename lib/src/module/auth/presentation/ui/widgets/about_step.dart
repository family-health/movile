import 'package:app/src/module/auth/domain/enums/gender.dart';
import 'package:app/src/module/auth/presentation/logic/create_account_controller.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/index.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/form_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutStep extends GetView<CreateAccountController> {
  const AboutStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormHeader(title: "About", subtitle: "Tell more about you"),
        const SizedBox(height: 15.0),
        AuthTextFormField(hintText: "Name", obscureText: false, onChanged: controller.updateName),
        AuthTextFormField(hintText: "Surname", obscureText: false, onChanged: controller.updateSurname),
        const _GenderSelector(),
        AuthTextFormField(hintText: "Address", obscureText: false, onChanged: controller.updateAddress),
      ],
    );
  }
}

class _GenderSelector extends StatelessWidget {
  const _GenderSelector();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountController>(builder: (controller) {
      bool maleCheck = (controller.gender == Gender.male);
      bool femaleCheck = (controller.gender == Gender.female);

      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: () => controller.updateGender(Gender.male),
          child: _Gender(active: maleCheck, text: "Male", icon: Icons.male),
        ),
        GestureDetector(
          onTap: () => controller.updateGender(Gender.female),
          child: _Gender(active: femaleCheck, text: "Female", icon: Icons.female),
        ),
      ]);
    });
  }
}

class _Gender extends StatelessWidget {
  final bool active;
  final String text;
  final IconData icon;
  const _Gender({required this.active, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    Color boxColor = (active) ? Colors.black : Colors.grey;

    return Container(
      height: 60,
      width: 160,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(color: boxColor, borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(text, style: const TextStyle(color: Colors.white)),
        Icon(icon, color: Colors.white),
      ]),
    );
  }
}