import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/module/auth/domain/entities/user.dart';
import 'package:app/src/module/auth/domain/usecases/register_with_email_usecase.dart';
import 'package:app/src/shared/config/routes_config.dart';
import 'package:app/src/shared/utilities/snackbar.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:app/src/module/auth/domain/enums/gender.dart';

class CreateAccountController extends GetxController {
  //About step variables
  String name = "";
  String surname = "";
  Gender gender = Gender.male;
  String address = "";

  //Check about step status is complete
  bool aboutStatus = false;

  //Phone step variables
  String phone = "";

  //Check phone step status
  bool phoneStatus = false;

  //Height step variables
  double height = 0.0;

  //Check height step status
  bool heightStatus = false;

  //Height step variables
  double weight = 0.0;

  //Check height step status
  bool weightStatus = false;

  //Complete step variables
  String email = "";
  String password = "";
  String passwordRepeat = "";

  //Check complete step status
  bool completeStatus = false;

  void updateName(String value) {
    name = value;
    checkAboutStep();
  }

  void updateSurname(String value) {
    surname = value;
    checkAboutStep();
  }

  void updateGender(Gender value) {
    gender = value;
    checkAboutStep();
  }

  void updateAddress(String value) {
    address = value;
    checkAboutStep();
  }

  void checkAboutStep() {
    if (name.isNotEmpty && surname.isNotEmpty && address.isNotEmpty) {
      aboutStatus = true;
      update();
    } else {
      aboutStatus = false;
      update();
    }
  }

  void updatePhone(String value) {
    phone = value;
    checkPhoneStep();
  }

  void checkPhoneStep() {
    if (phone.length == 10) {
      phoneStatus = true;
      update();
    } else {
      phoneStatus = false;
      update();
    }
  }

  void updateHeight(String value) {
    if (value.isEmpty) {
      height = 0.0;
      checkHeightStep();
    } else {
      height = double.parse(value);
      checkHeightStep();
    }
  }

  void checkHeightStep() {
    if (height.isGreaterThan(0.0)) {
      heightStatus = true;
      update();
    } else {
      heightStatus = false;
      update();
    }
  }

  void updateWeight(String value) {
    if (value.isEmpty) {
      weight = 0.0;
      checkWeightStep();
    } else {
      weight = double.parse(value);
      checkWeightStep();
    }
  }

  void checkWeightStep() {
    if (weight.isGreaterThan(0.0)) {
      weightStatus = true;
      update();
    } else {
      weightStatus = false;
      update();
    }
  }

  void updateEmail(String value) {
    email = value;
    checkCompleteStep();
  }

  void updatePassword(String value) {
    password = value;
    checkCompleteStep();
  }

  void updateRepeatPassword(String value) {
    passwordRepeat = value;
    checkCompleteStep();
  }

  void checkCompleteStep() {
    bool emailCheck = (email.isNotEmpty);
    bool passwordCheck = ((password == passwordRepeat) && password.isNotEmpty && passwordRepeat.isNotEmpty);

    if (emailCheck && passwordCheck) {
      completeStatus = true;
      update();
    } else {
      completeStatus = false;
      update();
    }
  }

  void submit() async {
    RegisterWithEmailUsecase registerWithEmailUsecase = Get.find<RegisterWithEmailUsecase>();
    Either<Failure, User> usecaseResponse = await registerWithEmailUsecase(
      RegisterParams(
        email: email,
        password: password,
        name: name,
        lastname: surname,
        phone: phone,
      ),
    );

    completeStatus = false;
    update();

    usecaseResponse.fold((Failure failure) async {
      await Future.delayed(const Duration(seconds: 2));
      Snackbar().error(failure.title, failure.message);
      completeStatus = true;
      update();
    }, (User sucess) async {
      completeStatus = true;
      update();
      await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed(Routes.home);
    });
  }
}
