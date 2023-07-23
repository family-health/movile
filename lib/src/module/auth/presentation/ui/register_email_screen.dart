
import 'package:app/src/module/auth/presentation/ui/widgets/complete_form.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/height_form.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/phone_form.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/weight_form.dart';
import 'package:flutter/material.dart';

import 'package:app/src/module/common/presentation/ui/widgets/custom_stepper.dart';

import 'package:app/src/module/auth/presentation/ui/widgets/account_form.dart';

class RegisterEmailScreen extends StatelessWidget {
  const RegisterEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      const Step(title: Text("About"), content: AccountForm(), isActive: false),
      const Step(title: Text("Phone"), content: PhoneForm(), isActive: false),
      const Step(title: Text("Height"), content: HeightForm(), isActive: false),
      const Step(title: Text("Weight"), content: WeightForm(), isActive: false),
      const Step(title: Text("Complete"), content: CompleteForm(), isActive: false),
    ];

    StepperController controller = StepperController(steps: steps);

    return Scaffold(
      appBar: AppBar(title: const Text("Register"), elevation: 0.0),
      body: CustomStepper(controller: controller),);
  }
}
