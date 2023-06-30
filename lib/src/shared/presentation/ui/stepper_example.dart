import 'package:flutter/material.dart';

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stepper(
        currentStep: _index,
        elevation: 0.0,
        stepIconBuilder: (index, step) {
          return const Icon(
            Icons.access_alarm,
            size: 14,
            color: Colors.white,
          );
          // return Container(
          //   height: 14.0,
          //   width: 14.0,
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0), color: Colors.red),
          //   child: const Icon(Icons.access_alarm),
          // );
        },
        type: StepperType.horizontal,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_index <= 0) {
            setState(() {
              _index += 1;
            });
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: <Step>[
          Step(
            title: const Text('2'),
            isActive: (_index == 0),
            content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Content for Step 1'),
            ),
          ),
          Step(
            title: const Text('2'),
            isActive: (_index == 1),
            content: const Text('Content for Step 2'),
          ),
          Step(
            title: const Text('3'),
            isActive: (_index == 2),
            content: const Text('Content for Step 3'),
          ),
        ],
      ),
    ));
  }
}
