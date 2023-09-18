import 'package:app/src/module/auth/presentation/logic/create_account_controller.dart';
import 'package:app/src/module/auth/presentation/ui/complete_step.dart';
import 'package:app/src/module/auth/presentation/ui/height_step.dart';
import 'package:app/src/module/auth/presentation/ui/phone_step.dart';
import 'package:app/src/module/auth/presentation/ui/weight_step.dart';
import 'package:flutter/material.dart';

import 'package:app/src/shared/presentation/ui/widgets/custom_stepper.dart';

import 'package:app/src/module/auth/presentation/ui/about_step.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends GetView<CreateAccountController> {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateAccountController());

    return Scaffold(
      appBar: AppBar(title: const Text("Register"), elevation: 0.0),
      body: GetBuilder<CreateAccountController>(builder: (controller) {
        StepState aboutState = (controller.aboutStatus) ? StepState.complete : StepState.editing;
        StepState phoneState = (controller.phoneStatus) ? StepState.complete : StepState.editing;
        StepState heightState = (controller.heightStatus) ? StepState.complete : StepState.editing;
        StepState weightState = (controller.weightStatus) ? StepState.complete : StepState.editing;
        StepState completeState = (controller.completeStatus) ? StepState.complete : StepState.editing;

        return CustomStepper(
          steps: [
            Step(title: const Text("About"), content: const AboutStep(), state: aboutState),
            Step(title: const Text("Phone"), content: const PhoneStep(), state: phoneState),
            Step(title: const Text("Height"), content: const HeightStep(), state: heightState),
            Step(title: const Text("Weight"), content: const WeightStep(), state: weightState),
            Step(title: const Text("Complete"), content: const CompleteStep(), state: completeState),
          ],
          // ignore: avoid_print
          onStepComplete: controller.submit,
        );
      }),
    );
  }
}