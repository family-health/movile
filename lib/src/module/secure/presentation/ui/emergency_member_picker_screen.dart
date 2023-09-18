import 'package:app/src/module/family/domain/entities/family_member.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/module/secure/presentation/logic/emergency_member_picker_controller.dart';
import 'package:app/src/module/secure/presentation/ui/widgets/family_member_card.dart';

// todo: MembersController should be removed a shared folder
class EmergencyMemberPickerScreen extends GetView<EmergencyMemberPickerController> {
  const EmergencyMemberPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmergencyMemberPickerController());

    return Material(
      child: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Family members', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            background: Image.asset("assets/images/security/ambulance.png"),
          ),
        ),
        Obx(
          () => SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: controller.data.length,
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Get.back<FamilyMember>(result: controller.data[index]),
                    child: FamilyMemberCard(controller.data[index]),
                  );
                },
              ),
            ),
          ),
        )
      ]),
    );
  }
}
