import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/module/health/data/datasources/health/health_data_source.dart';
import 'package:app/src/module/health/data/datasources/local/health_local_data_source.dart';
import 'package:app/src/module/health/data/datasources/remote/health_remote_data_source.dart';
import 'package:app/src/module/health/domain/repositories/blood_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

class BloodRepository extends IBloodRepository {
  final IHealthDataSource health;
  final IHealthLocalDataSource local;
  final IHealthRemoteDataSource remote;

  BloodRepository(this.health, this.local, this.remote);

  @override
  Future<Either<Failure, bool>> createBloodGlucose(double value, HealthDataType type, DateTime date, HealthDataUnit unit) async {
    try {
      // ignore: unused_local_variable
      bool created = await health.writeHealthData(value, type, date, unit);
      // ignore: unused_local_variable
      Response uploaded = await remote.uploadUserHealthDataFromValue(value, type, date, unit);
      return const Right(true);
    } catch (e) {
      return const Left(SocketFailure("Create Blood Glucose", "Error"));
    }
  }




}