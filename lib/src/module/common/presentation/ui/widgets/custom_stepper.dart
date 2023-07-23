import 'package:app/src/module/common/presentation/logic/custom_stepper_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

export 'package:app/src/module/common/presentation/logic/custom_stepper_controller.dart';

class CustomStepper extends StatelessWidget {
  final StepperController controller;
  CustomStepper({super.key, required this.controller}){
    Get.put(controller);
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: SafeArea(
        child: _StepperBuilder(),
      ),
    );
  }
}

class _StepperBuilder extends StatelessWidget {
  const _StepperBuilder();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StepperController>(
      builder: (controller) {
        return Stepper(
          elevation: 0.0,
          type: StepperType.horizontal,
          controlsBuilder: controlsBuilder,
          stepIconBuilder: stepIconBuilder,
          onStepContinue: controller.onStepContinue,
          onStepCancel: controller.onStepCancel,
          currentStep: controller.currentStep,
          steps: controller.mapSteps(context),
        );
      },
    );
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
        OutlinedButton(
          onPressed: details.onStepCancel,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical:10.0),
            side: const BorderSide(color: Colors.black, width: 1.0)
          ),
          child: const Row(children: [
            Icon(Icons.arrow_back, color: Colors.black),
            SizedBox(width: 3.0),
            Text("Back", style: TextStyle(color: Colors.black))
          ]),
        ),
        TextButton(
          onPressed: details.onStepContinue,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical:10.0),
            backgroundColor: Colors.black
          ),
          child: const Row(
            children: [
            Text("Next", style: TextStyle(color: Colors.white)),
            SizedBox(width: 3.0),
            Icon(Icons.arrow_forward, color: Colors.white)
          ]),
        ),
      ],
    );
  }
}
