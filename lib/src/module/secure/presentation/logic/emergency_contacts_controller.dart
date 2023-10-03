// ignore_for_file: avoid_print

import 'package:app/src/module/family/data/datasources/family_provider.dart';
import 'package:app/src/module/family/data/models/family_member_model.dart';
import 'package:app/src/module/family/domain/entities/family_member.dart';
import 'package:app/src/module/secure/presentation/ui/emergency_member_picker_screen.dart';
import 'package:app/src/shared/data/models/api/response_api_model.dart';
import 'package:app/src/shared/presentation/logic/app_controller.dart';
import 'package:get/get.dart';

class EmergencyContactsController extends GetxController with StateMixin<List<FamilyMember>> {
  final AppController _appController = Get.find<AppController>();
  final FamilyProvider _familyProvider = FamilyProvider();

  Future fetchMembers(bool isEmergencyContact) async {
    change(null, status: RxStatus.loading());
    ResponseApiModel<List<dynamic>> response = await _familyProvider.getAllFamilyByUserId(_appController.user!.id, _appController.token!);
    List<FamilyMember> data = [];
    if (response.data != null) {
      data = response.data!
          .map((e) => FamilyMember.fromMap(e))
          .where((member) => member.isVerified == true)
          .where((member) => member.isEmergency == true)
          .toList();
    }
    change(data, status: RxStatus.success());
  }

  addEmergencyContactFromFamilyMembers() async {
    FamilyMember? familyMember = await Get.to<FamilyMember?>(() => const EmergencyMemberPickerScreen());
    if (familyMember == null) return;

    FamilyProvider familyProvider = FamilyProvider();

    try {
      await familyProvider.updateById(
          FamilyMemberModel.fromJson({
            "avatar": familyMember.avatar,
            "name": familyMember.name,
            "lastName": familyMember.lastName,
            "phone": familyMember.phone,
            "email": familyMember.email,
            "relation": familyMember.relation,
            "isVerified": familyMember.isVerified,
            "isEmergency": true,
          }),
          _appController.token!,
          familyMember.id!);
      print("success");
    } catch (e) {
      print("Notify error");
    }
  }
}
