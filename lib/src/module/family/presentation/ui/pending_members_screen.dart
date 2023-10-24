import 'package:app/src/module/family/presentation/logic/pending_members_controller.dart';
import 'package:app/src/module/family/presentation/ui/widgets/pending_member_card.dart';
import 'package:app/src/shared/presentation/ui/widgets/empty_widget.dart';
import 'package:flutter/material.dart';

// ignore_for_file: avoid_print

import 'package:app/src/module/family/domain/entities/family_member.dart';
import 'package:get/get.dart';

class PendingMembersScreen extends StatelessWidget {
  const PendingMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: _buildAppBar(),
      body: const _GetBuilder(),
    );
  }

  AppBar _buildAppBar() {
    TextStyle textStyle = const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.grey.shade100,
      leading: const BackButton(color: Colors.black),
      title: Text("Pending Invitations", style: textStyle),
    );
  }
}

class _GetBuilder extends GetView<PendingMembersController> {
  const _GetBuilder();

  @override
  Widget build(BuildContext context) {
    controller.fetchInvitations();

    return controller.obx(
      onLoaded,
      onLoading: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget onLoaded(List<FamilyMember>? data) {
    if (data == null || data.isEmpty) {
      return const Empty(title: "Invitations empty", message: "No pending invitations found",);
    } else {
      return _ListView(data);
    }
  }
}

class _ListView extends GetView<PendingMembersController> {
  final List<FamilyMember> data;
  const _ListView(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return PendingMemberCard(
            data[index],
            deleteCallback: () => controller.deleteInvitations(context, data[index].id!),
          );
        });
  }
}