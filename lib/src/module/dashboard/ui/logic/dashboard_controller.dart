import 'package:app/src/@core/values/enum.dart';
import 'package:app/src/module/auth/data/models/user_model_old.dart';
import 'package:app/src/module/family/data/models/family.dart';
import 'package:app/src/module/family/data/sources/family_provider.dart';
import 'package:app/src/@core/models/response_api_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//Google Fit Packages
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

// Controller States
enum ControllerStates {
  error,
  empty,
  loading,
  loaded,
}

class DashboardController extends GetxController {
  var user = UserModel.fromJson(GetStorage().read(STORAGE.USER_STORAGE) ?? {});
  final families = <Family>[].obs;
  FamilyProvider familyProvider = FamilyProvider();

  @override
  void onInit() {
    super.onInit();
    getAllFamilies();
  }

  Future<void> getAllFamilies() async {
    ResponseApiModel responseApi =
        await familyProvider.getAllFamilyByUserId(user.id!, user.token!);
    List<Family> familyList = [];

    if (responseApi.data != null) {
      familyList = Family.fromJsonList(responseApi.data);
    } else {
      familyList = [];
    }
    families.value = familyList;
  }

  List<Family> getFirstTwoFamilies() {
    return families.length > 1 ? families.sublist(0, 2) : families;
  }

  ControllerStates controllerState = ControllerStates.loading;

//getters and setters
  List<HealthDataPoint> get healthData => _healthData;

// health declarations
  final HealthFactory _health = HealthFactory();
  late List<HealthDataPoint> _healthData = [];

  DashboardController() {
    //todo: Only test purpose
    controllerState = ControllerStates.loaded;
    // fetchHealthData();
  }

  Future<void> requestPermissions() async {
    await Permission.activityRecognition.request();
  }

  void fetchHealthData() async {
    final types = [
      // HealthDataType.ELECTROCARDIOGRAM, //?only require apple watch
      HealthDataType.HEART_RATE,
      HealthDataType.BLOOD_GLUCOSE,
      HealthDataType.BLOOD_OXYGEN,
      // HealthDataType.HEART_RATE_VARIABILITY_SDNN, //? only require apple watch
      // HealthDataType.LOW_HEART_RATE_EVENT, //? only require apple watch
      // HealthDataType.HIGH_HEART_RATE_EVENT, //? only require apple watch
      // HealthDataType.HEADACHE_UNSPECIFIED, //? only require apple watch
      // HealthDataType.HEADACHE_NOT_PRESENT, //? only require apple watch
      // HealthDataType.HEADACHE_MILD, //? only require apple watch
      // HealthDataType.HEADACHE_SEVERE, //? only require apple watch
    ];

    final permissions = [
      // HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      // HealthDataAccess.READ,
      // HealthDataAccess.READ,
      // HealthDataAccess.READ,
      // HealthDataAccess.READ,
      // HealthDataAccess.READ,
      // HealthDataAccess.READ,
      // HealthDataAccess.READ,
    ];

    // get data within the last 24 hours
    // todo: change within time
    // final now = DateTime.now();
    // final yesterday = now.subtract(Duration(days: 300));

    // request types data and permissions
    await _health.requestAuthorization(types, permissions: permissions);

    // clean duplicated healthData
    _healthData = HealthFactory.removeDuplicates(_healthData);

    controllerState = ControllerStates.loaded;
    update();
  }

  void goToFamilyListFamilies() {
    Get.toNamed(ROUTES.ROUTE_FAMILY_LIST_FAMILIES);
  }
}
