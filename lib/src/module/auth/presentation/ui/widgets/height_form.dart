import 'package:app/src/module/auth/presentation/ui/widgets/index.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/form_header.dart';
import 'package:flutter/material.dart';

class HeightForm extends StatelessWidget {
  const HeightForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormHeader(title: "Height", subtitle: "What is your Height?"),
        SizedBox(height: 15.0),
        Input(controller: null, hintText: "Height", obscureText: false),
      ],
    );
  }
}
