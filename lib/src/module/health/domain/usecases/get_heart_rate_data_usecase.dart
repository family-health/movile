import 'package:app/src/@core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:health/health.dart';
import 'package:app/src/@core/usecases/usecases.dart';
import 'package:app/src/module/health/domain/repositories/heart_rate_repository.dart';

class GetHeartRateDataUsecase implements UseCase<dynamic, NoParams> {
  final IHeartRateRepository repository;

  GetHeartRateDataUsecase(this.repository);

  @override
  Future<Either<Failure, List<HealthDataPoint>>> call(params) async {
    return repository.getHeartRateData();
  }
}