import 'package:app/src/module/common/presentation/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomElevatedButton.icon(
            icon: Text(
              "work",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: null,
            label: Text(
              "String",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
