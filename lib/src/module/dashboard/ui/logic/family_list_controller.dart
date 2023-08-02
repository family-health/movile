import 'package:app/src/module/common/data/models/response_api_model.dart';
import 'package:app/src/module/profile/data/models/user_model_old.dart';
import 'package:app/src/module/family/data/sources/family_provider.dart';
import 'package:app/src/module/dashboard/ui/logic/dashboard_controller.dart';
import 'package:app/src/shared/utilities/toaster_alert.dart';
import 'package:app/src/shared/routes/routes_deprecated.dart';
import 'package:app/src/shared/config/storage_deprecated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class FamilyListController extends GetxController {
  UserModel user = UserModel.fromJson(GetStorage().read(STORAGE.USER_STORAGE));
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

    ResponseApiModel<dynamic> responseApi = await _familyProvider.deleteById(id, user.token ?? '');
    progressDialog.close();

    if (responseApi.success == true) {
      Alertas.success('Familiar eliminado correctamente!');
      progressDialog.close();
    } else {
      Alertas.error(responseApi.message);
      progressDialog.close();
    }

    progressDialog.close();
  }
}