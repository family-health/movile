import 'package:app/src/@core/error/exceptions.dart';
import 'package:app/src/module/health/data/models/health_day_data_model.dart';
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
  Future uploadUserHealthDataPoint(HealthDataPoint point) async {
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
  Future<Response> uploadUserHealthDataFromValue(double value, HealthDataType type, DateTime date, HealthDataUnit unit) async {
    try {
      AppController appController = Get.find<AppController>();
      String userId = appController.user!.id;
      String token = appController.token!;

      Response response = await connect.post("/api/health-data/create", {
        "value": value,
        "type": type.name,
        "code": null,
        "unit": unit.name,
        "userId": userId
      }, headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token",
      });

      return response;
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

  @override
  Future<List<HealthDayDataModel?>> getHealthDataOfWeek(HealthDataType type, bool clean) async {
    try {
      AppController appController = Get.find<AppController>();
      String userId = appController.user!.id;
      String token = appController.token!;

      Response response = await connect.get("/api/health-data/getpromedioAllWeek/userId/$userId/type/${type.name}", headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token",
      });

      if (response.statusCode == 200) {
        List<dynamic> data = response.body["data"];
        List<HealthDayDataModel?> list = data.map((e) => HealthDayDataModel(x: double.parse(e["x"].toString()), y: double.parse(e["y"].toString()))).toList();

        if (clean) {
          list.removeWhere((value) => value!.y == 0 || value.y == 0.0);
        } else {

          List<double> weekDays = [];
          List<double> missingWeekDays = [];
          
          for (int i = 0; i < list.length; i++) {
            weekDays.add(list[i]!.x);
          }

          List.generate(6, (index) {
            double weekDay = double.parse(index.toString());
            if (!weekDays.contains(weekDay)) missingWeekDays.add(weekDay);
          });

          for (double missinWeekDay in missingWeekDays) {
             list.add(HealthDayDataModel(x: missinWeekDay, y: 0.0));
          }

          list.sort((a, b) => a!.x.compareTo(b!.x));
        }

        return list;
      }else {
        throw ServerException(response.body["message"]);
      }
    } catch (e) {
       rethrow;
    }
  }
}