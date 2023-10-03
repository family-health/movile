// ignore_for_file: avoid_print

import 'package:app/src/module/family/domain/entities/family_member.dart';
import 'package:app/src/module/family/presentation/logic/family_router_controller.dart';
import 'package:app/src/module/family/presentation/logic/family_members_controller.dart';
import 'package:app/src/module/family/presentation/logic/pending_members_controller.dart';
import 'package:app/src/module/family/presentation/ui/widgets/family_member_card.dart';
import 'package:app/src/shared/presentation/ui/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FamilyMembersController());
    Get.put(PendingMembersController());
    FamilyRouterController router = Get.put(FamilyRouterController());

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const _AppBar(),
      body: const _GetBuilder(),
      floatingActionButton: FloatingActionButton(
        heroTag: "navigatoToInviteMember",
        onPressed: router.navigateToInviteMember,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    FamilyRouterController router = Get.put(FamilyRouterController());
    PendingMembersController pendingMembersController = Get.find<PendingMembersController>();
    pendingMembersController.fetchInvitations();

    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey.shade100,
      title: const Text("My Family", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      actions: [
        IconButton(
          onPressed: router.navigateToPendingMembers,
          color: Colors.black,
          icon: Obx(() {
            int counter = pendingMembersController.counter.value;
            Widget icon = const Icon(Icons.email_outlined);
            if (counter > 0) {
              icon = const Icon(Icons.mark_email_unread_outlined);
            }
            return icon;
          }),
        ),
      ],
    );
  }
}

class _GetBuilder extends GetView<FamilyMembersController> {
  const _GetBuilder();

  @override
  Widget build(BuildContext context) {
    controller.fetchMembers();

    return controller.obx(
      onLoaded,
      onLoading: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget onLoaded(List<FamilyMember>? data) {
    if (data == null || data.isEmpty) {
      return const Empty(title: "Members", message:"No members found");
    } else {
      return _ListView(data);
    }
  }
}

class _ListView extends GetView<FamilyMembersController> {
  final List<FamilyMember> data;
  const _ListView(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return FamilyMemberCard(data[index]);
      },
    );
  }
}
