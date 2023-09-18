import 'package:app/src/@core/error/failures.dart';
import 'package:app/src/@core/resources/router/routes_config.dart';
import 'package:app/src/@core/utilities/snackbar.dart';
import 'package:app/src/shared/presentation/logic/app_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  //About step variables
  String name = "";
  String surname = "";
  Gender gender = Gender.M;
  Rx<DateTime> birthday = DateTime.now().obs;
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

  void updateBirthday(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      fieldLabelText: "SELECT YOUR BIRTHDAY DATE",
      helpText: "SELECT YOUR BIRTHDAY DATE",
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2030),
    );

    if (pickedDate == null) return;
    birthday.value = pickedDate;

    update();
  }

  void updateAddress(String value) {
    address = value;
    checkAboutStep();
  }

  void checkAboutStep() {
    if (name.isNotEmpty && surname.isNotEmpty) {
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
        gender: gender.name,
        weight: weight,
        height: height,
        birth: birthday.value,
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
      AppController appController = Get.find<AppController>();
      appController.reload();
      update();
      await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed(Routes.main);
    });
  }
}
