// ignore_for_file: unnecessary_null_comparison
import 'package:get/get.dart';

bool isValidLoginForm(String email, String password) {
  if (email.isEmpty) {
    Get.snackbar("Error", "El email is requerido");
    return false;
  }

  if (!GetUtils.isEmail(email)) {
    Get.snackbar("Error", "El email no es valido");
    return false;
  }

  if (password.isEmpty) {
    Get.snackbar("Error", "La contraseña es requerido");
    return false;
  }
  return true;
}

bool isValidRegisterForm(String email, String password, String repeatPassword,
    String name, String lastName, String phone) {
  if (name.isEmpty) {
    Get.snackbar("Error", "El nombre es requerido");
    return false;
  }

  if (lastName.isEmpty) {
    Get.snackbar("Error", "El apellido es requerido");
    return false;
  }

  if (phone.isEmpty) {
    Get.snackbar("Error", "El celular es requerido");
    return false;
  }

  if (password.length < 7) {
    Get.snackbar("Error", "La contraseña debe ser mayor a 6");
    return false;
  }

  if (phone.length < 7) {
    Get.snackbar("Error", "El telefono debe ser mayor a 6");
    return false;
  }

  if (email.isEmpty) {
    Get.snackbar("Error", "El email is requerido");
    return false;
  }

  if (!GetUtils.isEmail(email)) {
    Get.snackbar("Error", "El email no es valido");
    return false;
  }

  if (password.isEmpty) {
    Get.snackbar("Error", "La contraseña es requerido");
    return false;
  }

  if (password != repeatPassword) {
    Get.snackbar("Error", "Las contraseñas no coinciden");
    return false;
  }

  return true;
}

bool isValidUpdateUserForm(String name, String lastName, String phone) {
  if (name.isEmpty) {
    Get.snackbar("Error", "El nombre es requerido");
    return false;
  }

  if (lastName.isEmpty) {
    Get.snackbar("Error", "El apellido es requerido");
    return false;
  }

  if (phone.isEmpty) {
    Get.snackbar("Error", "El celular es requerido");
    return false;
  }

  if (phone.length < 7) {
    Get.snackbar("Error", "El telefono debe ser mayor a 6");
    return false;
  }

  return true;
}

bool isValidCreateFamilyForm(
    String name, String lastName, String phone, String email, String relation) {
  if (name.isEmpty) {
    Get.snackbar("Error", "La relacion es requerido");
    return false;
  }
  if (lastName.isEmpty) {
    Get.snackbar("Error", "La relacion es requerido");
    return false;
  }
  if (phone.isEmpty) {
    Get.snackbar("Error", "La relacion es requerido");
    return false;
  }

  if (email.isEmpty) {
    Get.snackbar("Error", "El email is requerido");
    return false;
  }

  if (!GetUtils.isEmail(email)) {
    Get.snackbar("Error", "El email no es valido");
    return false;
  }

  if (relation.isEmpty) {
    Get.snackbar("Error", "La relacion es requerido");
    return false;
  }
  return true;
}
