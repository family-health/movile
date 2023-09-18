import 'package:app/src/@core/error/exceptions.dart';
import 'package:app/src/module/health/data/datasources/health/health_data_source.dart';
import 'package:health/health.dart';

class HealthDataSource implements IHealthDataSource {
  final HealthFactory _health = HealthFactory(useHealthConnectIfAvailable: true);

  @override
  Future<bool> deleteHealthData(HealthDataType type, startTime, DateTime endTime) async {
    return true;
  }

  @override
  Future<List<HealthDataPoint>> getHealthData(DateTime startTime, DateTime endTime, List<HealthDataType> types) async {
    try {
      List<HealthDataPoint> data = await _health.getHealthDataFromTypes(startTime, endTime, [HealthDataType.HEART_RATE]);
      return data;
    } catch (e) {
      // ignore: avoid_print
      throw CacheException("Health library error");
    }
  }

  @override
  bool checkDataTypeAvailable(HealthDataType type) {
    return _health.isDataTypeAvailable(type);
  }
}