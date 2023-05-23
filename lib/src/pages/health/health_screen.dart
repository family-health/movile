import 'package:app/src/pages/health/health_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HealthController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: authorize, child: const Text("Authorize")),
            TextButton(onPressed: fetchData, child: const Text("Fetch data")),
            TextButton(onPressed: viewData, child: const Text("View data")),
          ],
        ),
      ),
    );
  }

  void authorize(){
    final HealthController controller = Get.find();
    controller.authroize();
  }

  void fetchData(){
    final HealthController controller = Get.find();
    controller.fetchData();
  }

  void viewData(){
    // ignore: avoid_print
    print("View data");
  }
}