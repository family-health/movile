
import 'package:app/src/module/auth/presentation/ui/widgets/body_form.dart';
import 'package:flutter/material.dart';

import 'package:app/src/shared/presentation/ui/widgets/custom_stepper.dart';

import 'package:app/src/module/auth/presentation/ui/widgets/account_form.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/email_form.dart';

class RegisterSteps extends StatelessWidget {
  const RegisterSteps({super.key});

  @override
  Widget build(BuildContext context) {
    List<Step> steps = [
      const Step(title: Text("Account"), content: AccountForm(), isActive: false),
      const Step(title: Text("Account"), content: AccountForm(), isActive: false),
      const Step(title: Text("Body"), content: BodyForm(), isActive: false),
      const Step(title: Text("Complete"), content: EmailForm(), isActive: false),
    ];

    StepperController controller = StepperController(steps: steps);

    return Material(
      child: CustomStepper(controller: controller),
    );
  }
}
