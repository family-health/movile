import 'package:app/src/@core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:health/health.dart';

abstract class IBloodRepository {
  Future<Either<Failure,bool>> createBloodGlucose(double value, HealthDataType type, DateTime date, HealthDataUnit unit);
}