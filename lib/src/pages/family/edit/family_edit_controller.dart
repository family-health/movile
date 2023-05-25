import 'package:app/src/enum/enum.dart';
import 'package:app/src/models/family.dart';
import 'package:app/src/models/response_api.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/dashboard/dashboard_controller.dart';
import 'package:app/src/providers/family_provider.dart';
import 'package:app/src/utils/toast_alert.dart';
import 'package:app/src/utils/validate_inputs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class FamilyEditController extends GetxController {
  User user = User.fromJson(GetStorage().read(STORAGE.USER_STORAGE));
  final family = Family().obs;

  @override
  void onInit() {
    super.onInit();
    getFamilyById(Get.parameters['id'] ?? '');
  }

  final DashboardController _dashboardController =
      Get.put(DashboardController());

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController relationController = TextEditingController();

  void updateFamilyById(BuildContext context, String id) async {
    ProgressDialog progressDialog = ProgressDialog(context: context);

    FamilyProvider familyProvider = FamilyProvider();

    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String relation = relationController.text.trim();

    if (isValidCreateFamilyForm(name, lastName, phone, email, relation)) {
      progressDialog.show(max: 10, msg: "Actualizando Familiar ...");
      Family family = Family(
          email: email,
          lastName: lastName,
          name: name,
          phone: phone,
          relation: relation,
          userId: user.id);
      ResponseApi responseApi =
          await familyProvider.updateById(family, user.token ?? '', id);
      progressDialog.close();
      if (responseApi.success == true) {
        _dashboardController.getAllFamilies();
        Alertas.success(responseApi.message ?? 'Todo correcto');
      } else {
        Alertas.error("No se pudo actualizar familiar");
      }
    }
  }

  void getFamilyById(String id) async {
    FamilyProvider familyProvider = FamilyProvider();
    ResponseApi responseApi =
        await familyProvider.getOneFamilyId(id, user.token ?? '');
    if (responseApi.success == true) {
      // Actualizar valor de la variable observable
      family.value = Family.fromJson(responseApi.data);

      nameController.text = family.value.name ?? '';
      lastNameController.text = family.value.lastName ?? '';
      phoneController.text = family.value.phone ?? '';
      emailController.text = family.value.email ?? '';
      relationController.text = family.value.relation ?? '';
    } else {
      Alertas.error("No se pudo actualizar familiar");
    }
  }
}
