import 'package:app/src/module/health/data/models/health_day_data_model.dart';
import 'package:app/src/module/health/data/repositories/health_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

import '../../../../@core/error/failures.dart';

class BloodGlucoseChartController extends GetxController {

  List<HealthDayDataModel?> healthData = [];

  @override
  void onInit() {
    super.onInit();
    initializeBloodGlucoseData();
  }

  BarChartData get data {
    return BarChartData(
      gridData: const FlGridData(show: false),
      barGroups: getGroupData(),
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.grey,
          tooltipMargin: -10,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          getTooltipItem: getTooltipItem,
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true, getTitlesWidget: getBottomTitles, reservedSize: 38),
        ),
      ),
    );
  }

  BarTooltipItem? getTooltipItem(BarChartGroupData groupData, int groupIndex, BarChartRodData rodData, int rodIndex) {
    String weekDay;

    switch (groupData.x) {
      case 0:
        weekDay = 'Monday';
        break;
      case 1:
        weekDay = 'Tuesday';
        break;
      case 2:
        weekDay = 'Wednesday';
        break;
      case 3:
        weekDay = 'Thursday';
        break;
      case 4:
        weekDay = 'Friday';
        break;
      case 5:
        weekDay = 'Saturday';
        break;
      case 6:
        weekDay = 'Sunday';
        break;
      default:
        throw Error();
    }

    TextStyle textStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    TextStyle spanStyle = const TextStyle(color: Colors.white);

    return BarTooltipItem("$weekDay \n", textStyle, children: [
      TextSpan(
        text: (rodData.toY - 1).toString(),
        style: spanStyle,
      )
    ]);
  }

  BarChartGroupData makeGroupData(int x, double y, {bool isTouched = false, Color? barColor, double width = 22, List<int> showTooltips = const []}) {
    return BarChartGroupData(x: x, showingTooltipIndicators: showTooltips, barRods: [
      BarChartRodData(
        borderRadius: BorderRadius.circular(0.0),
        toY: isTouched ? y + 1 : y,
        color: isTouched ? Colors.black : barColor,
        width: width,
        borderSide: const BorderSide(color: Colors.black),
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 160,
          color: Colors.transparent,
        ),
      )
    ]);
  }

  List<BarChartGroupData> getGroupData() {
    return healthData.map((e) {
      switch (e!.x) {
        case 0:
          return makeGroupData(0, e.y, barColor: Colors.black);
        case 1:
          return makeGroupData(1, e.y, barColor: Colors.black);
        case 2:
          return makeGroupData(2, e.y, barColor: Colors.black);
        case 3:
          return makeGroupData(3, e.y, barColor: Colors.black);
        case 4:
          return makeGroupData(4, e.y, barColor: Colors.black);
        case 5:
          return makeGroupData(5, e.y, barColor: Colors.black);
        case 6:
          return makeGroupData(6, e.y, barColor: Colors.black);
        case 7:
          return makeGroupData(7, e.y, barColor: Colors.black);
        default:
          return throw Error();
      }
    }).toList();
  }

  Widget getBottomTitles(double value, TitleMeta meta){
    Text text;
    const TextStyle style = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

    switch (value.toInt()) {
      case 0:
        text = const Text('M', style: style);
        break;
      case 1:
        text = const Text('T', style: style);
        break;
      case 2:
        text = const Text('W', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('F', style: style);
        break;
      case 5:
        text = const Text('S', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
       text = const Text('', style: style);
    }

    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }

  void initializeBloodGlucoseData() async {
    HealthRepository healthRepository = Get.find<HealthRepository>();
    Either<Failure, List<HealthDayDataModel?>> response = await healthRepository.getHealthDataOfWeek(HealthDataType.BLOOD_GLUCOSE, false);
    response.fold((error) {}, (data) {
      healthData = data;
    });

    update();
  }
}
