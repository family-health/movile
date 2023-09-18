import 'package:app/src/module/health/data/datasources/health/health_data_source.dart';
import 'package:app/src/module/health/data/datasources/local/health_local_data_source.dart';
import 'package:app/src/module/health/data/datasources/remote/health_remote_data_source.dart';
import 'package:app/src/module/health/domain/repositories/health_repository.dart';
import 'package:health/health.dart';

class HealthRepository implements IHealthRepository {
  final IHealthDataSource health;
  final IHealthLocalDataSource local;
  final IHealthRemoteDataSource remote;

  HealthRepository(this.health, this.local, this.remote);

  @override
  Future pushHealthDataPoint(HealthDataPoint point) async {
    remote.createUserHealthDataPoint(point);
  }
}
