import 'package:app/src/module/health/data/models/health_day_data_model.dart';
import 'package:dartz/dartz.dart';
import 'package:health/health.dart';

import '../../../../@core/error/failures.dart';

abstract class IHealthRepository {
  Future pushHealthDataPoint(HealthDataPoint point);
  Future<Either<Failure, List<HealthDayDataModel?>>> getHealthDataOfWeek(HealthDataType type, bool clean);
}