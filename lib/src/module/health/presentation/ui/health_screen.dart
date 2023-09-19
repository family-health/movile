import 'package:app/src/module/health/presentation/logic/heart_rate_chart_controller.dart';
import 'package:app/src/module/health/presentation/ui/health_testing_screen.dart';
import 'package:app/src/shared/presentation/logic/workmanager_controller.dart';
import 'package:fl_chart/fl_chart.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HealthTestingScreen()));
              },
              icon: const Icon(Icons.thermostat_rounded))
        ],
      ),
      body: Column(children: [
        // _HeartRateChart(),
      ]),
    );
  }
}


// class _HeartRateChart extends GetView<HealthRateChartController> {
//   _HeartRateChart();

//   final Color bgColor = Colors.black;

  
//   SideTitles leftTitles() => SideTitles(
//         getTitlesWidget: leftTitleWidgets,
//         showTitles: true,
//         interval: 1,
//         reservedSize: 40,
//       );

//   SideTitles get bottomTitles => SideTitles(
//         showTitles: true,
//         reservedSize: 32,
//         interval: 1,
//         getTitlesWidget: bottomTitleWidgets,
//       );

//   FlTitlesData get titles => FlTitlesData(
//         bottomTitles: AxisTitles(
//           sideTitles: bottomTitles,
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: leftTitles(),
//         ),
//       );

//   List<LineChartBarData> get lineBarsData => [
//         LineChartBarData(),
//         LineChartBarData(),
//         LineChartBarData(),
//       ];

//   LineChartData data = LineChartData(
//     lineTouchData: lineTouchData1,
//     gridData: gridData,
//     titlesData: titles,
//     borderData: borderData,
//     lineBarsData: lineBarsData1,
//     minX: 0,
//     maxX: 14,
//     maxY: 4,
//     minY: 0,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return LineChart(
//       data,
//       duration: const Duration(milliseconds: 250),
//     );
//   }

//   Widget leftTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 14,
//     );
//     String text;
//     switch (value.toInt()) {
//       case 1:
//         text = '1m';
//         break;
//       case 2:
//         text = '2m';
//         break;
//       case 3:
//         text = '3m';
//         break;
//       case 4:
//         text = '5m';
//         break;
//       case 5:
//         text = '6m';
//         break;
//       default:
//         return Container();
//     }

//     return Text(text, style: style, textAlign: TextAlign.center);
//   }

//   Widget bottomTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 16,
//     );

//     Widget text;
//     switch (value.toInt()) {
//       case 2:
//         text = const Text('SEPT', style: style);
//         break;
//       case 7:
//         text = const Text('OCT', style: style);
//         break;
//       case 12:
//         text = const Text('DEC', style: style);
//         break;
//       default:
//         text = const Text('');
//         break;
//     }

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 10,
//       child: text,
//     );
//   }
// }
