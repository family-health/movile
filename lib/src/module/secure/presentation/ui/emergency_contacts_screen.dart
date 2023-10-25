import 'package:app/src/module/family/domain/entities/family_member.dart';
import 'package:app/src/module/secure/domain/entities/emergency_contact.dart';
import 'package:app/src/module/secure/presentation/logic/emergency_contacts_controller.dart';
import 'package:app/src/module/secure/presentation/ui/widgets/emergency_contact_card.dart';
import 'package:app/src/shared/presentation/ui/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmergencyContactsScreen extends GetView<EmergencyContactsController> {
  const EmergencyContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmergencyContactsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency Contacts"),
      ),
      body: controller.obx((state){
        if (state == null || state.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Empty(title: "Emergency Contacts", message: "You dont have emergency \n contacts"),
              ElevatedButton(
                onPressed: (){
                  controller.addEmergencyContactFromFamilyMembers();
                },
                child: const Text("Add emergency contact"),
              )
            ],
          );
        }

        return Column(children: [
          const _AddNew(),
          Expanded(child: _ListView(state)),
        ]);

      }),
    );
  }
}

class _AddNew extends GetView<EmergencyContactsController> {
  const _AddNew();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> controller.addEmergencyContactFromFamilyMembers(),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10.0),
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey, //New
            blurRadius: 25.0,
            offset: Offset(0, -0.3),
          )
        ]),
        child: const ListTile(
          title: Text("Add New"),
          subtitle: Text("Select a family member"),
          leading: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.black,
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  final List<FamilyMember> data;
  const _ListView(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: data.length,
      itemBuilder: (context, index) {
        EmergencyContact emergencyContact = EmergencyContact.fromFamilyMember(data[index]);
        return EmergencyContactCard(emergencyContact);
      },
      separatorBuilder: (context, index) {
        return const Divider(height: 0.0, color: Colors.black);
      },
    );
  }
}
