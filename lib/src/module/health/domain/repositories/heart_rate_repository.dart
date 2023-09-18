import 'package:app/src/@core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:health/health.dart';

abstract class IHeartRateRepository {
  Future<Either<Failure, List<HealthDataPoint>>> getHeartRateData();
}