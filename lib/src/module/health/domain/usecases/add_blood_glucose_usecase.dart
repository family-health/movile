import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/@core/usecases/usecase.dart';
import 'package:app/src/module/health/domain/repositories/blood_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:health/health.dart';

class AddBloodGlucoseUsecase extends UseCase<bool, AddBloodGlucoseParams> {
  final IBloodRepository repository;

  AddBloodGlucoseUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(AddBloodGlucoseParams params) {
    return repository.createBloodGlucose(params.value, params.type, params.date, params.unit);
  }
}

class AddBloodGlucoseParams extends Equatable {
  final double value;
  final HealthDataType type;
  final DateTime date;
  final HealthDataUnit unit;

  const AddBloodGlucoseParams(this.value, this.type, this.date, this.unit);



  @override
  List<Object?> get props => [value, type, date, unit];
}
