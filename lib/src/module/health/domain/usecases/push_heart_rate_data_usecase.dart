import 'package:app/src/@core/usecases/usecase.dart';
import 'package:app/src/module/health/domain/repositories/health_repository.dart';
import 'package:health/health.dart';

class PushHeartRateDataUsecase implements UseCase <void, HealthDataPoint> {
  final IHealthRepository repository;

  PushHeartRateDataUsecase(this.repository);

  @override
  Future<void> call(params) {
    return repository.pushHealthDataPoint(params);
  }
}