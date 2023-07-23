import 'package:get/get.dart';
import 'package:flutter/material.dart';

class StepperController extends GetxController {

  List<Step> steps;
  int currentStep = 0;

  StepperController({required this.steps});

  List<Step> mapSteps(BuildContext context){
    return steps.asMap().entries.map(
      (e) {
        int index = e.key;
        return Step(
          title: Visibility( visible: (index == currentStep),child: e.value.title),
          state: StepState.complete,
          content: Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 250,
            child: e.value.content,
          ),
          isActive: (index == currentStep),
        );
      },
    ).toList();
  }

  void changeStepState(){

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

  void onStepTapped(){}
}