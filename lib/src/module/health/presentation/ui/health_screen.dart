import 'package:app/src/shared/presentation/logic/workmanager_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/module/health/presentation/logic/health_controller.dart';

class HealthScreen extends GetView<HealthController> {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HealthController());
    WorkmanagerController workmanagerController = Get.find<WorkmanagerController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Health Progress"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: controller.requestHealthPermissions, child: const Text("Request Permissions")),
            ElevatedButton(onPressed: controller.getHealthData, child: const Text("Fetch Data")),
            ElevatedButton(onPressed: controller.getHeartRateData, child: const Text("Fetch Heart Data")),
            ElevatedButton(onPressed: controller.testUsecase, child: const Text("Fetch Heart Data Fold")),
            const SizedBox(height: 10.0),
            ElevatedButton(onPressed: workmanagerController.cancelUploadHealthDataPointsTask, child: const Text("Stop background process")),
            ElevatedButton(onPressed: workmanagerController.startUploadHealthDataPointsTask, child: const Text("Start background process")),
          ],
        ),
      ),
    );
  }
}
