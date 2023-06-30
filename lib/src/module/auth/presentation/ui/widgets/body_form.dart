import 'package:app/src/module/auth/presentation/ui/widgets/index.dart';
import 'package:flutter/material.dart';

class BodyForm extends StatelessWidget {
  const BodyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Input(controller: null, hintText: "Height", obscureText: false),
      Input(controller: null, hintText: "Weight", obscureText: false),
    ],);
  }
}