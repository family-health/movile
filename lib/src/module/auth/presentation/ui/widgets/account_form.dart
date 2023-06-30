import 'package:app/src/module/auth/presentation/ui/widgets/index.dart';
import 'package:flutter/material.dart';

class AccountForm extends StatelessWidget {
  const AccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text("Account"),
          Text("Tell us more about you"),
        ],),
        Input(controller: null, hintText: "Name", obscureText: false),
        Input(controller: null, hintText: "Surname", obscureText: false),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _TestContainer(active: false, text: "Male", icon: Icons.male),
            _TestContainer(active: true, text: "Female", icon: Icons.female),
          ],
        ),
        Input(controller: null, hintText: "example@domain.com", obscureText: false),
        Input(controller: null, hintText: "**********", obscureText: true),
      ],
    );
  }
}

class _TestContainer extends StatelessWidget {
  final bool active;
  final String text;
  final IconData icon;
  const _TestContainer({required this.active, required this.icon, required this.text});

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
        const Text("Male", style: TextStyle(color: Colors.white)),
        Icon(icon, color: Colors.white),
      ]),
    );
  }
}
