import 'package:health/health.dart';

abstract class IHealthRepository {
  Future pushHealthDataPoint(HealthDataPoint point);
}