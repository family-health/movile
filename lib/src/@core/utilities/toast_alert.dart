import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app/src/@core/enums/enum.dart';

class Alertas {
  static void warning(String mensaje) {
    Fluttertoast.showToast(
      msg: mensaje,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.yellow[600],
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  static void error(String mensaje) {
    Fluttertoast.showToast(
      msg: mensaje,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red[600],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void success(String mensaje) {
    Fluttertoast.showToast(
      msg: mensaje,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green[600],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

Future<bool> alertDialogRemoveSesion(String title, String mensaje) async {
  bool confirmado = false;

  await Get.defaultDialog(
    title: title,
    content: Text(
      mensaje,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    textCancel: "Cancelar",
    textConfirm: "Aceptar",
    cancelTextColor: Get.theme.primaryColor,
    confirmTextColor: Colors.white,
    onConfirm: () async {
      GetStorage().remove(STORAGE.USER_STORAGE);
      Get.offNamedUntil(ROUTES.ROUTE_SING_IN, (route) => false);
      confirmado = true;
    },
  );

  return confirmado;
}
