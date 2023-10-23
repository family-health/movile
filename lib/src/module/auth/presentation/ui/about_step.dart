import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:app/src/module/auth/domain/enums/gender.dart';
import 'package:app/src/module/auth/presentation/logic/create_account_controller.dart';
import 'package:app/src/module/auth/presentation/ui/ui_widgets.dart';

class AboutStep extends GetView<CreateAccountController> {
  const AboutStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormHeader(title: "About", subtitle: "Tell more about you"),
        const SizedBox(height: 15.0),
        AuthTextFormField(
          hintText: "Name",
          obscureText: false,
          onChanged: controller.updateName,
        ),
        AuthTextFormField(
          hintText: "Surname",
          obscureText: false,
          onChanged: controller.updateSurname,
        ),
        const _GenderSelector(),
        Obx(
          () => AuthTextFormField(
            hintText: DateFormat('yyyy-MM-dd').format(controller.birthday.value),
            readOnly: true,
            obscureText: false,
            keyboardType: TextInputType.none,
            ontap: () => controller.updateBirthday(context),
          ),
        ),
      ],
    );
  }
}

class _GenderSelector extends StatelessWidget {
  const _GenderSelector();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountController>(builder: (controller) {
      bool maleCheck = (controller.gender == Gender.M);
      bool femaleCheck = (controller.gender == Gender.F);

      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: () => controller.updateGender(Gender.M),
          child: _Gender(active: maleCheck, text: "Male", icon: Icons.male),
        ),
        GestureDetector(
          onTap: () => controller.updateGender(Gender.F),
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
      width: MediaQuery.of(context).size.width * 0.40,
      decoration: BoxDecoration(color: boxColor, borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(text, style: const TextStyle(color: Colors.white)),
        const SizedBox(width: 5),
        Icon(icon, color: Colors.white),
      ]),
    );
  }
}