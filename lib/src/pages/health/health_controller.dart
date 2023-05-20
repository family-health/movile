import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

enum ControllerState {
  dataNotFetched,
  fetchingData,
  dataReady,
  noData,
  authorized,
  authNotGranted,
  dataAdded,
  dataDeleted,
  dataNotAdded,
  dataNotDeleted,
  stepsReady
}

class HealthController extends GetxController {
  List<HealthDataPoint> _healthDataList = [];
  ControllerState _state = ControllerState.dataNotFetched;

  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

  static final types = [
    HealthDataType.WEIGHT,
    HealthDataType.STEPS,
    HealthDataType.HEIGHT,
    HealthDataType.BLOOD_GLUCOSE,
    HealthDataType.WORKOUT,
    HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
    HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
    // Uncomment these lines on iOS - only available on iOS
    // HealthDataType.AUDIOGRAM
  ];


  void authroize() async{
    await Permission.activityRecognition.request();
    await Permission.location.request();

    // bool? hasPermissions = await health.hasPermissions(types, permissions: permissions);
  }
  

  void fetchData() async {
    _state = ControllerState.fetchingData;

    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));

    try {
       List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(yesterday, now, types);
    } catch (e) {
      print(e);
    }
  }
}
