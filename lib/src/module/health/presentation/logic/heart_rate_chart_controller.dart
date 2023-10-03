import 'package:app/src/module/health/data/repositories/health_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

import '../../../../@core/error/failures.dart';
import '../../data/models/health_day_data_model.dart';

class HeartRateChartController extends GetxController { 

  // const [
  //         FlSpot(1, 60),
  //         FlSpot(2, 70),
  //         FlSpot(3, 60),
  //         FlSpot(4, 80),
  //         FlSpot(5, 90),
  //         FlSpot(6, 110),
  //         FlSpot(7, 87),
  //       ],

  List<FlSpot> _spots = [];

  @override
  void onInit() {
    super.onInit();
    initializeSpots();
  }
  
  LineChartData get sampleData1 {
    return LineChartData(
      lineTouchData: lineTouchData1,
      gridData: gridData,
      titlesData: titlesData1,
      borderData: borderData,
      lineBarsData: lineBarsData1,
      minX: 0,
      maxX: 6,
      maxY: 120,
      minY: 50,
    );
  }

  LineTouchData get lineTouchData1 {
    return LineTouchData(
      handleBuiltInTouches: true,
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
      ),
    );
  }

  FlTitlesData get titlesData1 {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: bottomTitles,
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: leftTitles(),
      ),
    );
  }

  List<LineChartBarData> get lineBarsData1 {
    return [
      LineChartBarData(
        isCurved: true,
        color: Colors.black,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        // spots: list.map((e) => FlSpot(e["x"], e["y"])).toList(),
        spots: _spots,
      ),
    ];
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 60:
        text = '60';
        break;
      case 70:
        text = '70';
        break;
      case 80:
        text = '80';
        break;
      case 90:
        text = '90';
        break;
      case 100:
        text = '100';
        break;
      case 110:
        text = '110';
        break;
      case 120:
        text = '120';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() {
    return SideTitles(
      getTitlesWidget: leftTitleWidgets,
      showTitles: true,
      interval: 1,
      reservedSize: 40,
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Mo', style: style);
        break;
      case 1:
        text = const Text('Tu', style: style);
        break;
      case 2:
        text = const Text('Tr', style: style);
      case 3:
        text = const Text('We', style: style);
        break;
      case 4:
        text = const Text('Fr', style: style);
        break;
      case 5:
        text = const Text('Sa', style: style);
        break;
      case 6:
        text = const Text('So', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles {
    return SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );
  }

  FlGridData get gridData => const FlGridData(show: true);

  FlBorderData get borderData {
    return FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(color: Colors.black, width: 4),
        left: BorderSide(color: Colors.transparent),
        right: BorderSide(color: Colors.transparent),
        top: BorderSide(color: Colors.transparent),
      ),
    );
  }

  void initializeSpots() async {
    HealthRepository healthRepository = Get.find<HealthRepository>();
    Either<Failure, List<HealthDayDataModel?>> response = await healthRepository.getHealthDataOfWeek(HealthDataType.HEART_RATE, true);
    response.fold((error){
      // ignore: avoid_print
      print("show snackbar");
    }, (data){
      _spots = [];

      for (HealthDayDataModel? element in data) { 
        _spots.add(FlSpot(element!.x, element.y));
      }
    });

    update();
  }
}
