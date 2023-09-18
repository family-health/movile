import 'package:app/src/module/family/presentation/ui/invite_member_screen.dart';
import 'package:app/src/module/family/presentation/ui/pending_members_screen.dart';
import 'package:get/get.dart';

class FamilyRouterController extends GetxController {
  void navigateToInviteMember(){
    Get.to(const InviteMemberScreen());
  }

  void navigateToPendingMembers(){
    Get.to(const PendingMembersScreen());
  }
}
