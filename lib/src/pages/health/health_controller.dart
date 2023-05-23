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
  final List<HealthDataPoint> _healthDataList = [];
  // ControllerState _state = ControllerState.dataNotFetched;

  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

  static final types = [
    // HealthDataType.STEPS,
    HealthDataType.BLOOD_GLUCOSE,
    // Uncomment these lines on iOS - only available on iOS
    // HealthDataType.AUDIOGRAM
  ];

  final permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();

  // or this

  // static final permissions = [
  //     HealthDataAccess.READ_WRITE,
  //     HealthDataAccess.READ_WRITE
  // ];

  

  Future authroize() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();

    bool? hasPermissions = await health.hasPermissions(types, permissions: permissions);
    hasPermissions = false;

    if (!hasPermissions) {
      try {
        await health.requestAuthorization(types, permissions: permissions);
        // ignore: avoid_print
        print("Cheked permissions");
      } catch (e) {
        // ignore: avoid_print
        print("Exception in authorize: $e");
      }
    }
  }
  
  void fetchData() async {
    // _state = ControllerState.fetchingData;

    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));

    _healthDataList.clear();

    try {
       List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(yesterday, now, types);
       _healthDataList.addAll((healthData.length < 100) ? healthData : healthData.sublist(0, 100));
       // ignore: avoid_print
       print(healthData);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void writeData() async {
    // test
  }
}
