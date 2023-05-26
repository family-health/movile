import 'package:app/src/pages/health/health_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

class HealthViewScreen extends StatelessWidget {
  const HealthViewScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final HealthController controller = Get.find();
    final List<HealthDataPoint> data = controller.getHealthData;
    


    return Scaffold(body: ListView.builder(itemCount: data.length, itemBuilder: (context, index) {
      String name = "No detectado";
      String value = "No detectado";

       HealthDataPoint dataPoint = data[index];

      if (dataPoint.type.name == HealthDataType.STEPS.name) {
        name = "Steps";
        value = "${dataPoint.value} ${dataPoint.unit.name}";
      }

      if (dataPoint.type.name == HealthDataType.HEART_RATE.name) {
        name = "Hearth Rate";
        value = "${dataPoint.value} ${dataPoint.unit.name}";
      }

      if (dataPoint.type.name == HealthDataType.BLOOD_OXYGEN.name) {
        name = "Blood Oxygen";
        value = "${dataPoint.value} ${dataPoint.unit.name}";
      }

      return HealthCard(name: name, value: value);
    }),);
  }
}


class HealthCard extends StatelessWidget {
  final String name;
  final String value;
  const HealthCard({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text("Valor: $value"),
    );
  }
}