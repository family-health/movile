import 'package:app/src/@core/enums/enum.dart';
import 'package:app/src/module/circle/data/models/family.dart';
import 'package:app/src/@core/api/response_api_model.dart';
import 'package:app/src/module/auth/data/models/user_model_old.dart';
import 'package:app/src/module/dashboard/ui/logic/dashboard_controller.dart';
import 'package:app/src/module/circle/data/sources/family_provider.dart';
import 'package:flutter/material.dart';
import 'package:app/src/@core/utilities/validate_inputs.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:app/src/@core/utilities/toast_alert.dart';
import 'package:get/get.dart';

class FamilyController extends GetxController {
  UserModel user = UserModel.fromJson(GetStorage().read(STORAGE.USER_STORAGE));
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
      ResponseApiModel responseApi = await familyProvider.create(family, user.token ?? '');
      progressDialog.close();
      if (responseApi.success == true) {
        _dashboardController.getAllFamilies();
        clearForm();
        Alertas.success(responseApi.message);
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