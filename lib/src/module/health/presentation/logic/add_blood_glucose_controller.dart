import 'package:app/src/@core/utilities/snackbar.dart';
import 'package:app/src/module/health/domain/usecases/add_blood_glucose_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

import '../../../../@core/error/failures.dart';

class AddBloodGlucoseController extends GetxController {
  late double value;

  void onChange(String? value) {
    this.value = double.parse(value!);
    // ignore: avoid_print
    print(value);
  }

  void saveBloodGlucose() async {
    final now = DateTime.now();
    AddBloodGlucoseUsecase addBloodGlucoseUsecase = Get.find<AddBloodGlucoseUsecase>();
    Either<Failure, bool> result = await addBloodGlucoseUsecase.call(AddBloodGlucoseParams(value, HealthDataType.BLOOD_GLUCOSE, now, HealthDataUnit.MILLIGRAM_PER_DECILITER));
    result.fold((l) {
      Get.back();
      Snackbar().error("Error", "Error when add glucose");
    }, (r) {
      Get.back();
      Snackbar().success("Glucose added", "Glucose added succesfully");
    });
  }
}
