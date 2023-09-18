import 'package:app/src/@core/error/exceptions.dart';
import 'package:app/src/shared/presentation/logic/app_controller.dart';
import 'package:get/get.dart';
import 'package:app/src/@core/utilities/environment.dart';
import 'package:app/src/module/health/data/datasources/remote/health_remote_data_source.dart';
import 'package:health/health.dart';

class HealthRemoteDataSource implements IHealthRemoteDataSource {
  final GetConnect connect = GetConnect();

  HealthRemoteDataSource(){
    connect.baseUrl = Environment.apiBaseUrl;
  }

  @override
  Future createUserHealthDataPoint(HealthDataPoint point) async {
    try {
      AppController appController = Get.find<AppController>();
      String userId = appController.user!.id;
      String token = appController.token!;

      Response response = await connect.post("/api/health-data/create", {
        "value": point.value,
        "type": point.type,
        "code": point.type,
        "unit": point.unit,
        "userId": userId
      }, headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token",
      });

      // ignore: avoid_print
      print(response);
    } catch (e) {
      throw ServerException("Server exception on  health-data/create endpoint");
    }
  }

  @override
  Future<void> deleteUserHealthData(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<void> getUserHealthData(String userId) {
    throw UnimplementedError();
  }
}