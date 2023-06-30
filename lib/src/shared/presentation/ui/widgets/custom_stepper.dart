import 'package:app/src/shared/presentation/logic/stepper_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

export 'package:app/src/shared/presentation/logic/stepper_controller.dart';

class CustomStepper extends StatelessWidget {
  final StepperController controller;
  const CustomStepper({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Get.put(controller);

    return Material(
      child: SafeArea(
        child: GetBuilder<StepperController>(builder: (controller){
          return Stepper(
          elevation: 0.0,
          type: StepperType.horizontal,
          physics: const ClampingScrollPhysics(),
          controlsBuilder: controlsBuilder,
          stepIconBuilder: stepIconBuilder,
          onStepContinue: controller.onStepContinue,
          onStepCancel: controller.onStepCancel,
          currentStep: controller.currentStep,
          steps: controller.steps.asMap().entries.map((e){
            int index = e.key;
            return Step(
                title: e.value.title,
                content: SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                  child: e.value.content,
                ),
                isActive: isActive(index),
              );
          }).toList()
                );
        })
      ),
    );
  }

  bool isActive(int index){
    return (index == controller.currentStep);
  }

  Widget controlsBuilder(BuildContext context, ControlsDetails details) {
    return _StepperControls(context: context, details: details);
  }

  Widget stepIconBuilder(int currentStep, StepState state){
    return const Icon(
      Icons.check,
      color: Colors.white,
      size: 14.0,
    );
  }
}

class _StepperControls extends StatelessWidget {
  final BuildContext context;
  final ControlsDetails details;
  const _StepperControls({required this.context, required this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: details.onStepCancel,
          child: const Text('Back'),
        ),
        TextButton(
          onPressed: details.onStepContinue,
          child: const Text('Continue'),
        ),
      ],
    );
  }
}
