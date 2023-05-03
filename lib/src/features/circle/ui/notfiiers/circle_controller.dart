import 'package:app/src/features/circle/data/models/family.dart';
import 'package:app/src/common/models/response_api.dart';
import 'package:app/src/common/enviroments/environment.dart';
import 'package:app/src/features/auth/data/models/user_model.dart';
import 'package:app/src/features/dashboard/ui/notifiers/dashboard_controller.dart';
import 'package:app/src/features/circle/data/sources/family_provider.dart';
import 'package:flutter/material.dart';
import 'package:app/src/common/utilities/validate_inputs.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:app/src/common/utilities/toast_alert.dart';
import 'package:get/get.dart';

class FamilyController extends GetxController {
  User user = User.fromJson(GetStorage().read(Environment.USER_STORAGE));
  final DashboardController _dashboardController =
      Get.put(DashboardController());

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController relationController = TextEditingController();

  void createFamily(BuildContext context) async {
    ProgressDialog progressDialog = ProgressDialog(context: context);

    FamilyProvider familyProvider = FamilyProvider();

    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String relation = relationController.text.trim();

    if (isValidCreateFamilyForm(name, lastName, phone, email, relation)) {
      progressDialog.show(max: 10, msg: "Creando Familiar ...");
      Family family = Family(
          email: email,
          lastName: lastName,
          name: name,
          phone: phone,
          relation: relation,
          userId: user.id);
      ResponseApi responseApi =
          await familyProvider.create(family, user.token ?? '');
      progressDialog.close();
      if (responseApi.success == true) {
        _dashboardController.getAllFamilies();
        clearForm();
        Alertas.success(responseApi.message ?? 'Todo correcto');
      } else {
        Alertas.error("Usuario no se pudo autenticar");
      }
    }
  }

  void clearForm() {
    nameController.text = '';
    lastNameController.text = '';
    phoneController.text = '';
    emailController.text = '';
    relationController.text = '';
  }
}
