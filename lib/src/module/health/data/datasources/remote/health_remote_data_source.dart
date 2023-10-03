import 'package:app/src/module/health/data/models/health_day_data_model.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

abstract class IHealthRemoteDataSource {
  IHealthRemoteDataSource();

  Future<void> getUserHealthData(String userId);

  Future<void> uploadUserHealthDataPoint(HealthDataPoint point);

  Future<Response>  uploadUserHealthDataFromValue(double value, HealthDataType type, DateTime date, HealthDataUnit unit);
  
  Future<void> deleteUserHealthData(String userId);

  Future<List<HealthDayDataModel?>> getHealthDataOfWeek(HealthDataType type, bool clean);
}