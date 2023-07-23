import 'package:app/src/module/auth/presentation/ui/widgets/index.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/form_header.dart';
import 'package:flutter/material.dart';

class WeightForm extends StatelessWidget {
  const WeightForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormHeader(title: "Weight", subtitle: "What is your Weight?"),
        SizedBox(height: 15.0),
        Input(controller: null, hintText: "Weight", obscureText: false),
      ],
    );
  }
}
