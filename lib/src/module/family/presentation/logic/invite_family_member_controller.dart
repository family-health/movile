// ignore_for_file: avoid_print

import 'package:app/src/@core/utilities/snackbar.dart';
import 'package:app/src/module/family/data/datasources/family_provider.dart';
import 'package:app/src/module/family/data/models/family_member_model.dart';
import 'package:app/src/module/family/presentation/logic/pending_members_controller.dart';
import 'package:app/src/shared/data/models/api/response_api_model.dart';
import 'package:app/src/shared/presentation/logic/app_controller.dart';
import 'package:app/src/shared/presentation/ui/avatars_screen.dart';
import 'package:get/get.dart';

class InviteFamilyMemberController extends GetxController {
  String avatar = "assets/images/avatar/girl-1.png";
  String name = "";
  String surname = "";
  String email = "";
  String relation = "";
  String phone = "";

  void updateAvatar() async {
      String? selectedAvatar = await Get.to<String?>(() => const AvatarsScreen());
      if (selectedAvatar == null) return; 
      avatar = selectedAvatar;
      update();
  }

  void updateName(String value) {
    name = value.trim();
  }

  void updateSurname(String value) {
    surname = value.trim();
  }

  void updateEmail(String value) {
    email = value.trim();
  }

  void updateRelation(String? value) {
    if (value == null) return;
    relation = value.trim();
  }

  void updatePhone(String value) {
    phone = value.trim();
  }

  void submit() async {
    AppController appController = Get.find<AppController>();
    FamilyProvider familyProvider = FamilyProvider();

    FamilyMemberModel familyMember = FamilyMemberModel(
      avatar: avatar,
      email: email,
      lastName: surname,
      name: name,
      phone: phone,
      relation: relation,
      userId: appController.user!.id,
    );
 
    ResponseApiModel response = await familyProvider.create(familyMember, appController.token ?? '');

    if (response.success) {
      PendingMembersController pendingMembersController = Get.find<PendingMembersController>();
      pendingMembersController.fetchInvitations();
      Get.back();
      Snackbar().success("Family Member", 'Member $name $surname was created successfully');
    } else {
      Snackbar().error("Family Member", response.message);
    }
  }
}