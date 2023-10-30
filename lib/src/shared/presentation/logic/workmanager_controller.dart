import 'package:app/src/@core/utilities/snackbar.dart';
import 'package:app/src/shared/presentation/logic/app_controller.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:workmanager/workmanager.dart';
import 'package:app/src/@core/utilities/tasks.dart';

import 'dart:developer' as developer;

class WorkmanagerController extends GetxController {
  final int pushHealthDataAlarmID = 0;
  final AppController _appController = Get.find<AppController>();

  void startUploadHealthDataPointsTask() {
    Snackbar snackbar = Snackbar();
    snackbar.success("Background Porcess","Starting upload health data background process");

    Workmanager().registerPeriodicTask(
      Tasks.uploadHealthDataPointsTask,
      Tasks.uploadHealthDataPointsTask,
      frequency: const Duration(minutes: 15),
      inputData: {
        'id': _appController.user!.id,
        'token': _appController.token,
      },
    );
  }

  void cancelUploadHealthDataPointsTask(){
    Snackbar snackbar = Snackbar();
    snackbar.success("Background Porcess","Stopping upload health data background process");
    Workmanager().cancelByUniqueName(Tasks.uploadHealthDataPointsTask);
  }
}

class UploadHealthDataTask {
  static const String taskName = Tasks.uploadHealthDataPointsTask;
  
  static final HealthFactory _health = HealthFactory(useHealthConnectIfAvailable: true);
  static final List<HealthDataType> _healthTypes = [
    HealthDataType.HEART_RATE,
    HealthDataType.STEPS,
    HealthDataType.WORKOUT,
  ];

  static Future<bool> call(Map<String,dynamic>? inputData) async {
    final GetConnect connect = GetConnect();
    connect.baseUrl = "https://utmfamilyhealth.site";

    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));

    final String userId = inputData?["id"];
    final String token = inputData?["token"];

    List<HealthDataPoint> healthData = [];

    try {
      developer.log("Start get health data");
      healthData = await _health.getHealthDataFromTypes(yesterday, now, _healthTypes);
      developer.log("End get health data");
    } catch (e) {
      Exception("Error collect health data");
    }

    try {
      developer.log("Start push health data, count:${healthData.length}");

      await Future.forEach(healthData, (HealthDataPoint point) async {
        // ignore: unused_local_variable
        Response response = await connect.post("/api/health-data/create", {
          "value": NumericHealthValue.fromJson(point.value.toJson()).numericValue,
          "type": point.type.name,
          "code": point.hashCode,
          "unit": point.unitString,
          "userId": userId
        }, headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $token",
        });

        developer.log("HealthDataPoint uploaded!");
      });
    } catch (e) {
      Exception("Error pushing health data to remote db");
    }

    return Future.value(true);
  }
}
