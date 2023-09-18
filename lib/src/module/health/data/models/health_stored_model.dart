import 'package:health/health.dart';

class HealthStoredModel {
  final DateTime startTime;
  final DateTime endTime;
  final  List<HealthDataPoint> data;

  HealthStoredModel({
    required this.startTime,
    required this.endTime,
    required this.data,
  });
}
