// ignore_for_file: avoid_print
import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/@core/usecases/usecases.dart';
import 'package:app/src/module/health/domain/usecases/get_heart_rate_data_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class HealthController extends GetxController {
  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

  List<HealthDataPoint> _healthData = [];

  static final List<HealthDataType> _healthTypes = [
    HealthDataType.HEART_RATE,
    HealthDataType.STEPS,
    HealthDataType.WATER,
    HealthDataType.WORKOUT,
    HealthDataType.BLOOD_GLUCOSE,
  ];

  final List<HealthDataAccess> _healthPermissions = [
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ,
    HealthDataAccess.READ_WRITE,
  ];

  Future requestHealthPermissions() async {
    try {
      await Permission.activityRecognition.request();
      await Permission.location.request();

      final requested = await health.requestAuthorization(_healthTypes, permissions: _healthPermissions);
      final hasPermission = await health.hasPermissions(_healthTypes);

      print("RESULT >> $requested, $hasPermission, ${health.useHealthConnectIfAvailable}");
    } catch (e) {
      print(e);
    }
  }

  Future removeHealthPermissions() async {
    await health.revokePermissions();
  }

  Future deleteHealthData(HealthDataType type, DateTime startTime, DateTime endTime) async {
    try {
      await health.delete(type, startTime, endTime);
    } catch (e) {
      print(e);
    }
  }

  Future getHealthData() async {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));

    try {
      _healthData = await health.getHealthDataFromTypes(yesterday, now, _healthTypes);
      print(_healthData);
    } catch (e) {
      print("Get Health Data: $e");
    }
  }

  Future<List<HealthDataPoint>> getHeartRateData() async {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));

    try {
      List<HealthDataPoint> data = await health.getHealthDataFromTypes(yesterday, now, [HealthDataType.HEART_RATE]);
      return data;
    } catch (e) {
      print("Get Health Data: $e");
    }

    return [];
  }

  Future<List<HealthDataPoint>> getHealthDataPoint(HealthDataType type) async {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));

    try {
      List<HealthDataPoint> data = await health.getHealthDataFromTypes(yesterday, now, [type]);
      return data;
    } catch (e) {
      print("Get Health Data: $e");
    }

    return [];
  }

  Future<bool> addBloodGlucose() async {
    final now = DateTime.now();
    // final yesterday = now.subtract(const Duration(hours: 24));

    try {
      bool response = await health.writeHealthData(50.0, HealthDataType.BLOOD_GLUCOSE, now, now, unit: HealthDataUnit.MILLIGRAM_PER_DECILITER);
      return response;
    } catch (e) {
      print("Get Health Data: $e");
      return false;
    }
  }

  void testUsecase() async {
    GetHeartRateDataUsecase getHeartRateDataUsecase = Get.find<GetHeartRateDataUsecase>();
    Either<Failure, List<HealthDataPoint>> heartRateData = await getHeartRateDataUsecase.call(NoParams());
    heartRateData.fold((failure){
      print("failure");
    }, (data){
      print(data);
    });
  }
}