import 'package:app/src/enum/enum.dart';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/dashboard/dashboard_controller.dart';
import 'package:app/src/providers/family_provider.dart';
import 'package:app/src/utils/toast_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class FamilyListFamiliesController extends GetxController {
  User user = User.fromJson(GetStorage().read(STORAGE.USER_STORAGE));
  final DashboardController _dashboardController =
      Get.put(DashboardController());
  final FamilyProvider _familyProvider = FamilyProvider();

  void menuAction(
      dynamic selection, String id, BuildContext context, String email) {
    if (selection == 'Editar') {
      goToFamilyEditPage(id);
    } else if (selection == 'Eliminar') {
      alertDialogEliminar(
          'Elimiar', 'Estas seguro de eliminar este familiar?', id, context);
    } else if (selection == 'Invitar') {
      _familyProvider.sendInvitation(email, user.token ?? "");
    }
  }

  Future<bool> alertDialogEliminar(
      String title, String mensaje, String id, BuildContext context) async {
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
        _deleteFamilyById(context, id);

        Navigator.pop(context);
        _dashboardController.getAllFamilies();
        refresh();
        confirmado = true;
      },
    );

    return confirmado;
  }

  void goToFamilyEditPage(String id) {
    Get.toNamed(ROUTES().routeFamilyEdit(id));
  }

  void _deleteFamilyById(BuildContext context, String id) async {
    ProgressDialog progressDialog = ProgressDialog(context: context);

    progressDialog.show(max: 10, msg: "Registrando usuario ...");

    ResponseApi responseApi =
        await _familyProvider.deleteById(id, user.token ?? '');
    progressDialog.close();
    if (responseApi.success == true) {
      Alertas.success('Familiar eliminado correctamente!');
      progressDialog.close();
    } else {
      Alertas.error(responseApi.message ?? "Hubo un error");
      progressDialog.close();
    }

    progressDialog.close();
  }
}
