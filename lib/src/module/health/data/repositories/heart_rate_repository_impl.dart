import 'package:app/src/@core/error/exceptions.dart';
import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/module/health/data/datasources/local/health_local_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:health/health.dart';

import 'package:app/src/module/health/data/datasources/health/health_data_source.dart';
import 'package:app/src/module/health/data/datasources/remote/health_remote_data_source.dart';
import 'package:app/src/module/health/domain/repositories/heart_rate_repository.dart';

class HeartRateRepository implements IHeartRateRepository {
  final IHealthDataSource health;
  final IHealthLocalDataSource local;
  final IHealthRemoteDataSource remote;

  HeartRateRepository({required this.health, required this.local, required this.remote});

  @override
  Future<Either<Failure, List<HealthDataPoint>>> getHeartRateData() async {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));

    try {
      List<HealthDataPoint> data = await health.getHealthData(yesterday, now, [HealthDataType.HEART_RATE]);
      return Right(data);
    } on DependencyException catch (e) {
      return Left(DependencyFailure("Health", e.message));
    }
  }
}