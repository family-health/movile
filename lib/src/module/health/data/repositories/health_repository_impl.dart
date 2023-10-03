import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/module/health/data/datasources/health/health_data_source.dart';
import 'package:app/src/module/health/data/datasources/local/health_local_data_source.dart';
import 'package:app/src/module/health/data/datasources/remote/health_remote_data_source.dart';
import 'package:app/src/module/health/data/models/health_day_data_model.dart';
import 'package:app/src/module/health/domain/repositories/health_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:health/health.dart';

class HealthRepository implements IHealthRepository {
  final IHealthDataSource health;
  final IHealthLocalDataSource local;
  final IHealthRemoteDataSource remote;

  HealthRepository(this.health, this.local, this.remote);

  @override
  Future pushHealthDataPoint(HealthDataPoint point) async {
    remote.uploadUserHealthDataPoint(point);
  }
  
  @override
  Future<Either<Failure, List<HealthDayDataModel?>>> getHealthDataOfWeek(HealthDataType type, bool clean) async {
    try {
      List<HealthDayDataModel?> data = await remote.getHealthDataOfWeek(type, clean);
      return Right(data);
    } catch (e) {
      return const Left(SocketFailure("Error health data of week", "error obtain data"));
    }
  }
}
