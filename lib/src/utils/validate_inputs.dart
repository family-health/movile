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