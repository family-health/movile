import 'package:get/get.dart';
import 'package:flutter/material.dart';

class StepperController extends GetxController {

  List<Step> steps;
  int currentStep = 0;

  StepperController({required this.steps});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  
  void onStepCancel(){
    if (currentStep == 0) return;
    currentStep--;
    update();
  }

  void onStepContinue(){
    // int equal = currentStep + 1;
    if (currentStep + 1 == steps.length) return;
    currentStep++;
    update();
  }

  void onStepTapped(){

  }
}