import 'package:app/src/shared/presentation/logic/workmanager_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/module/health/presentation/logic/health_controller.dart';
import 'package:health/health.dart';

class HealthTestingScreen extends GetView<HealthController> {
  const HealthTestingScreen({super.key});

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
            ElevatedButton(onPressed: controller.removeHealthPermissions, child: const Text("Revoke Permissions")),
            ElevatedButton(onPressed: controller.getHealthData, child: const Text("Fetch Data")),
            ElevatedButton(onPressed: controller.getHeartRateData, child: const Text("Fetch Heart Data")),
            ElevatedButton(onPressed: controller.testUsecase, child: const Text("Fetch Heart Data Fold")),
            ElevatedButton(onPressed: ()=> controller.getHealthDataPoint(HealthDataType.DISTANCE_DELTA), child: const Text("Fetch Distance")),
            ElevatedButton(onPressed: ()=> controller.getHealthDataPoint(HealthDataType.WATER), child: const Text("Fetch Water")),
            ElevatedButton(onPressed: controller.addBloodGlucose, child: const Text("Add Glucose")),
            ElevatedButton(onPressed: ()=> controller.getHealthDataPoint(HealthDataType.BLOOD_GLUCOSE), child: const Text("Fetch Glucose")),
            const SizedBox(height: 10.0),
            ElevatedButton(onPressed: workmanagerController.cancelUploadHealthDataPointsTask, child: const Text("Stop background process")),
            ElevatedButton(onPressed: workmanagerController.startUploadHealthDataPointsTask, child: const Text("Start background process")),
          ],
        ),
      ),
    );
  }
}
