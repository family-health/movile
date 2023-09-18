import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/shared/presentation/logic/stepper_controller.dart';
export 'package:app/src/shared/presentation/logic/stepper_controller.dart';

class CustomStepper extends GetView<StepperController>{
  final void Function()? onStepComplete;
  final List<Step> steps;

  const CustomStepper({super.key, required this.steps, required this.onStepComplete});

  @override
  Widget build(BuildContext context) {
    Get.put(StepperController());
    controller.steps = steps;
    controller.onStepComplete = onStepComplete;

    return GetBuilder<StepperController>(builder: (controller) {
      return Stepper(
        elevation: 0.0,
        type: StepperType.horizontal,
        onStepContinue: controller.onStepContinue,
        onStepCancel: controller.onStepCancel,
        stepIconBuilder: stepIconBuilder,
        controlsBuilder: controlsBuilder,
        currentStep: controller.currentStep,
        steps: controller.steps.asMap().entries.map((e) {
          int index = e.key;
          Step step = e.value;
          bool isActive = (index == controller.currentStep);

          return Step(
            state: step.state,
            title: Visibility(visible: isActive, child: step.title),
            content: Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 250,
              child: step.content,
            ),
            isActive: isActive,
          );
        }).toList(),
      );
    });
  }

  Widget stepIconBuilder(int currentStep, StepState state) => _StepIconBuilder(currentStep: currentStep, state: state);

  Widget controlsBuilder(BuildContext context, ControlsDetails details) => _ControlsBuilders(context: context, details: details);
}

class _StepIconBuilder extends StatelessWidget {
  final int currentStep;
  final StepState state;
  const _StepIconBuilder({required this.currentStep, required this.state});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.check,
      color: Colors.white,
      size: 14.0,
    );
  }
}

class _ControlsBuilders extends GetView<StepperController> {
  final BuildContext context;
  final ControlsDetails details;
  const _ControlsBuilders({required this.context, required this.details});

  @override
  Widget build(BuildContext context) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildBackButton(),
          buildContinueButton(),
        ],
      );
  }

  Widget buildBackButton() {
    ButtonStyle buttonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      side: const BorderSide(color: Colors.black, width: 1.0),
    );

    return OutlinedButton(
      onPressed: details.onStepCancel,
      style: buttonStyle,
      child: const Row(children: [
        Icon(Icons.arrow_back, color: Colors.black),
        SizedBox(width: 3.0),
        Text("Back", style: TextStyle(color: Colors.black)),
      ]),
    );
  }

  Widget buildContinueButton() {
    ButtonStyle buttonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      backgroundColor: Colors.black,
      disabledBackgroundColor: Colors.black54,
    );
    return Obx(() {
      Step currentStep = controller.steps[details.currentStep];
      bool actionCheck = (currentStep.state == StepState.complete);

      return TextButton(
        onPressed: (actionCheck) ? details.onStepContinue : null,
        style: buttonStyle,
        child: const Row(children: [
          Text("Next", style: TextStyle(color: Colors.white)),
          SizedBox(width: 3.0),
          Icon(Icons.arrow_forward, color: Colors.white),
        ]),
      );
    });
  }
}