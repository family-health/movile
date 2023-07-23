import 'package:app/src/module/auth/presentation/ui/widgets/index.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/form_header.dart';
import 'package:flutter/material.dart';

class CompleteForm extends StatelessWidget {
  const CompleteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormHeader(title: "Complete", subtitle: "Complete your login info"),
        SizedBox(height: 15.0),
        Input(controller: null, hintText: "example@domain.com", obscureText: false),
        Input(controller: null, hintText: "**********", obscureText: true),
        Input(controller: null, hintText: "**********", obscureText: true),
    ],);
  }
}