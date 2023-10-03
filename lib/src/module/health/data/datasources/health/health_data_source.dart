import 'package:health/health.dart';

abstract class IHealthDataSource {
  bool checkDataTypeAvailable(HealthDataType type);
  Future<List<HealthDataPoint>> getHealthData(DateTime startTime, DateTime endTime, List<HealthDataType> types);
  Future<bool> deleteHealthData(HealthDataType type, startTime, DateTime endTime);
  Future<bool> writeHealthData(double value, HealthDataType type, DateTime date, HealthDataUnit unit);
}