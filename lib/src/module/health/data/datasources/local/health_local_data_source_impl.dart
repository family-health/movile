import 'package:app/src/module/health/data/datasources/local/health_local_data_source.dart';

class HealthLocalDataSource implements IHealthLocalDataSource {
  @override
  Future<void> readUserHealthData() {
    throw UnimplementedError();
  }

  @override
  Future<void> removeUserHealthData() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserHealthData() {
    throw UnimplementedError();
  }
}