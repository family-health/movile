import 'package:app/src/module/health/presentation/logic/blood_glucose_chart_controller.dart';
import 'package:app/src/module/health/presentation/logic/heart_rate_chart_controller.dart';
import 'package:app/src/module/health/presentation/ui/add_blood_glucose_screen.dart';
import 'package:app/src/module/health/presentation/ui/health_testing_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/module/health/presentation/logic/health_controller.dart';

class HealthScreen extends GetView<HealthController> {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HealthController());
    Get.put(HeartRateChartController());
    Get.put(BloodGlucoseChartController());

    return Scaffold(
      appBar: AppBar(title: const Text("Health Progress"), actions: [
        IconButton(
          icon: const Icon(Icons.troubleshoot_sharp),
          onPressed: () => pushHealthTesting(context),
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            BloodGlucoseChartController bloodGlucoseChartController = Get.find<BloodGlucoseChartController>();
            HeartRateChartController heartRateChartController = Get.find<HeartRateChartController>();
            //todo: quitar cuando termine la prueba
            bloodGlucoseChartController.initializeBloodGlucoseData();
            // heartRateChartController.initializeSpots();
          },
        )
      ]),
      floatingActionButton: FloatingActionButton( 
        heroTag: "navigatoToAddBloodGlucose",
        onPressed: () => pushAddBloodGlucose(context),
        child: const Icon(Icons.bloodtype_outlined, color: Colors.white),
      ),
      body: Column(children: [
        const SizedBox(height: 20.0),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
            width: 400,
            child: const Padding(padding: EdgeInsets.all(8.0), child: _HeartRateChart())),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.38,
            width: 400,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: _BloodGlucoseChart(),
            ))
      ]),
    );
  }

  void pushAddBloodGlucose(BuildContext context){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const AddBloodGlucoseScreen()));
  }

  void pushHealthTesting(BuildContext context){
     Navigator.push(context, MaterialPageRoute(builder: (context) => const HealthTestingScreen()));
  }
}

class _HeartRateChart extends GetView<HeartRateChartController> {
  const _HeartRateChart();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HeartRateChartController>(builder: (_){
      return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text("Heart Rate", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0),),
          const SizedBox(height: 5.0),
          const Text("Last 7 days"),
          const SizedBox(height: 20.0),
          Expanded(
            child: LineChart(
            controller.sampleData1,
            duration: const Duration(milliseconds: 250),
              ),
          )
        ],),
      ),
    );
    });
  }
}

class _BloodGlucoseChart extends GetView<BloodGlucoseChartController> {
  const _BloodGlucoseChart();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Blood Glucose", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0)),
          const SizedBox(height: 5.0),
          const Text("Last 7 days"),
          const SizedBox(height: 20.0),
          Expanded(child: GetBuilder<BloodGlucoseChartController>(builder: (_) {
            return BarChart(
              controller.data,
              swapAnimationDuration: const Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.linear, // Optional
            );
          }))
        ]),
      ),
    );
  }
}
