// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class StepperController extends GetxController {
  late void Function()? onStepComplete;
  
  late RxList<Step> _steps;
  List<Step> get steps => _steps;
  set steps(List<Step> value) => _steps = value.obs;
  
  int currentStep = 0;

  void onStepCancel() {
    if (currentStep == 0) return;
    currentStep--;
    update();
  }

  void onStepContinue() {
    if (currentStep + 1 == steps.length) {
      onStepComplete?.call();
      return;
    }

    currentStep++;
    update();
  }

  void onStepTapped() {}
}