import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamilyListFamiliesController extends GetxController {
  void menuAction(dynamic selection, String id) {
    if (selection == 'Editar') {
      goToFamilyEditPage(id);
    } else if (selection == 'Eliminar') {
      alertDialogEliminar('Elimiar', 'Estas seguro de eliminar este familiar?');
    }
  }

  Future<bool> alertDialogEliminar(String title, String mensaje) async {
    bool confirmado = false;

    await Get.defaultDialog(
      title: title,
      content: Text(
        mensaje,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
      textCancel: "Cancelar",
      textConfirm: "Aceptar",
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () async {
        confirmado = true;
      },
    );

    return confirmado;
  }

  void goToFamilyEditPage(String id) {
    Get.toNamed('/family/edit/$id');
  }
}
