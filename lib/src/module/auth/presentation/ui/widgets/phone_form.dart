import 'package:app/src/module/auth/presentation/ui/widgets/index.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/form_header.dart';
import 'package:flutter/material.dart';

class PhoneForm extends StatelessWidget {
  const PhoneForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormHeader(title: "Phone", subtitle: "What is your phone contact"),
        SizedBox(height: 15.0),
        Input(controller: null, hintText: "Phone", obscureText: false),
      ],
    );
  }
}
