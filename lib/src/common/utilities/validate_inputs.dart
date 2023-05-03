import 'package:get/get.dart';
import 'package:app/src/common/utilities/toast_alert.dart';

bool isValidLoginForm(String email, String password) {
  if (email.isEmpty) {
    Alertas.warning('El email es requerido');

    return false;
  }

  if (!GetUtils.isEmail(email)) {
    Alertas.warning('El email no es valido');
    return false;
  }

  if (password.isEmpty) {
    Alertas.warning("La contraseña es requerido");
    return false;
  }
  return true;
}

bool isValidRegisterForm(String email, String password, String repeatPassword,
    String name, String lastName, String phone) {
  if (name.isEmpty) {
    Alertas.warning("El nombre es requerido");
    return false;
  }

  if (lastName.isEmpty) {
    Alertas.warning("El apellido es requerido");
    return false;
  }

  if (phone.isEmpty) {
    Alertas.warning("El celular es requerido");
    return false;
  }

  if (password.length < 7) {
    Alertas.warning("La contraseña debe ser mayor a 6");
    return false;
  }

  if (phone.length < 7) {
    Alertas.warning("El telefono debe ser mayor a 6");
    return false;
  }

  if (email.isEmpty) {
    Alertas.warning("El email is requerido");
    return false;
  }

  if (!GetUtils.isEmail(email)) {
    Alertas.warning("El email no es valido");
    return false;
  }

  if (password.isEmpty) {
    Alertas.warning("La contraseña es requerido");
    return false;
  }

  if (password != repeatPassword) {
    Alertas.warning("Las contraseñas no coinciden");
    return false;
  }

  return true;
}

bool isValidUpdateUserForm(String name, String lastName, String phone) {
  if (name.isEmpty) {
    Alertas.warning("El nombre es requerido");
    return false;
  }

  if (lastName.isEmpty) {
    Alertas.warning("El apellido es requerido");
    return false;
  }

  if (phone.isEmpty) {
    Alertas.warning("El celular es requerido");
    return false;
  }

  if (phone.length < 7) {
    Alertas.warning("El telefono debe ser mayor a 6");
    return false;
  }

  return true;
}

bool isValidCreateFamilyForm(
    String name, String lastName, String phone, String email, String relation) {
  if (name.isEmpty) {
    Alertas.warning("La relacion es requerido");
    return false;
  }
  if (lastName.isEmpty) {
    Alertas.warning("La relacion es requerido");
    return false;
  }
  if (phone.isEmpty) {
    Alertas.warning("La relacion es requerido");
    return false;
  }

  if (email.isEmpty) {
    Alertas.warning("El email is requerido");
    return false;
  }

  if (!GetUtils.isEmail(email)) {
    Alertas.warning("El email no es valido");
    return false;
  }

  if (relation.isEmpty) {
    Alertas.warning("La relacion es requerido");
    return false;
  }
  return true;
}
