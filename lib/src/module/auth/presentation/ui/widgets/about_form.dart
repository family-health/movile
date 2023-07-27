import 'package:app/src/module/auth/presentation/logic/login_controller.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/index.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/form_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountForm extends GetView<LoginEmailController> {
  const AccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormHeader(title: "About", subtitle: "Tell more about you"),
        const SizedBox(height: 15.0),
        const Input(controller: null, hintText: "Name", obscureText: false),
        const Input(controller: null, hintText: "Surname", obscureText: false),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: ()=> controller.gender = Gender.male,
              child: Obx(() => _Gender(active: (controller.gender == Gender.male), text: "Male", icon: Icons.male)),
            ),
            GestureDetector(
              onTap: ()=> controller.gender = Gender.female,
              child: Obx(() => _Gender(active: (controller.gender == Gender.female), text: "Female", icon: Icons.female)),
            ),
          ],
        ),
        const Input(controller: null, hintText: "Address", obscureText: false),
      ],
    );
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
