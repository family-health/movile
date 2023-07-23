import 'package:app/src/module/auth/presentation/ui/widgets/index.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/form_header.dart';
import 'package:flutter/material.dart';

class AccountForm extends StatelessWidget {
  const AccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormHeader(title: "About", subtitle: "Tell more about you"),
        SizedBox(height: 15.0),
        Input(controller: null, hintText: "Name", obscureText: false),
        Input(controller: null, hintText: "Surname", obscureText: false),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _TestContainer(active: false, text: "Male", icon: Icons.male),
            _TestContainer(active: true, text: "Female", icon: Icons.female),
          ],
        ),
        Input(controller: null, hintText: "Address", obscureText: false),
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
