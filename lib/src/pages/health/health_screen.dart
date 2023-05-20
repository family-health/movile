import 'package:app/src/pages/health/health_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HealthController());

    return Scaffold(
      body: Column(children: [
        TextButton(onPressed: authorize, child: const Text("Authorize")),
        TextButton(onPressed: fetchData, child: const Text("Fetch data")),
      ],),
    );
  }

  void authorize(){
    final HealthController controller = Get.find();
    controller.authroize();
  }

  void fetchData(){
    final HealthController controller = Get.find();
    controller.authroize();
  }
}