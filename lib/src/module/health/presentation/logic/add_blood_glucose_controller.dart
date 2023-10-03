import 'package:app/src/module/health/domain/usecases/add_blood_glucose_usecase.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

class AddBloodGlucoseController extends GetxController {
  late double value;

  void onChange(String? value){
    this.value = double.parse(value!);
    // ignore: avoid_print
    print(value);
  }

  void saveBloodGlucose() async {
    final now = DateTime.now();
    AddBloodGlucoseUsecase addBloodGlucoseUsecase = Get.find<AddBloodGlucoseUsecase>();
    addBloodGlucoseUsecase.call(AddBloodGlucoseParams(value, HealthDataType.BLOOD_GLUCOSE, now, HealthDataUnit.MILLIGRAM_PER_DECILITER));
  }

}