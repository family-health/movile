import 'package:health/health.dart';

abstract class IHealthRemoteDataSource {
  IHealthRemoteDataSource();

  Future<void> getUserHealthData(String userId);

  Future<void> createUserHealthDataPoint(HealthDataPoint point);
  
  Future<void> deleteUserHealthData(String userId);
}