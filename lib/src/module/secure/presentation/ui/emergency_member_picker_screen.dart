import 'package:app/src/module/family/domain/entities/family_member.dart';
import 'package:app/src/module/family/presentation/logic/family_router_controller.dart';
import 'package:app/src/shared/presentation/ui/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/module/secure/presentation/logic/emergency_member_picker_controller.dart';
import 'package:app/src/module/secure/presentation/ui/widgets/family_member_card.dart';

class EmergencyMemberPickerScreen extends GetView<EmergencyMemberPickerController> {
  const EmergencyMemberPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmergencyMemberPickerController());
    controller.update();

    return SafeArea(
      child: Material(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 25,
              right: 25,
              bottom: 30.0,
            ),
            child: Column(children: [
              const Text("Add to your emergency book",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(height: 5.0),
              const Text("Please, select a family member",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  )),
              const SizedBox(height: 15.0),
              Container(width: 80, height: 2, color: Colors.black),
            ]),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: controller.obx(
                  onLoading: const Center(child: CircularProgressIndicator()),
                  (state) {
                if (state == null || state.isEmpty) {
                  return const _Empty();
                }

                return GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  children: List.generate(state.length, (index) {
                    return GestureDetector(
                      onTap: () => Get.back<FamilyMember>(result: state[index]),
                      child: FamilyMemberCard(state[index]),
                    );
                  }),
                );
              }),
            ),
          )
        ]),
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    return const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Empty(title: "Members", message: "You dont have contacts \n to add to your emergency list"),
      SizedBox(height: 10),
      // ElevatedButton(
      //   onPressed: addNewFamilyMember,
      //   child: const Text("Add a contact member"),
      // )
    ]);
  }

  void addNewFamilyMember() {
    FamilyRouterController familyRouterController = Get.find<FamilyRouterController>();
    familyRouterController.navigateToInviteMember();
  }
}
