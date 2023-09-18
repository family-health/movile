import 'package:app/src/module/secure/domain/entities/emergency_contact.dart';
import 'package:app/src/module/secure/presentation/logic/emergency_contacts_controller.dart';
import 'package:app/src/module/secure/presentation/ui/widgets/emergency_contact_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmergencyContactsScreen extends GetView<EmergencyContactsController> {
  const EmergencyContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmergencyContactsController());

    final EmergencyContact contact = EmergencyContact(
        id: "1",
        avatar: null,
        email: "josephdgb1996@gmail.com",
        name: "Joseph",
        lastName: "Garcia",
        phone: "0978757580",
        isVerified: true,
        relation: "Friend");

    return Scaffold(
        appBar: AppBar(title: const Text("Emergency Contacts")),
        body: Column(
          children: [
            const _AddNew(),
            Expanded(
              child: ListView.separated(
                itemCount: 10 + 1,
                itemBuilder: (context, index) {
                  return EmergencyContactCard(contact);
                },
                separatorBuilder: (context, index) {
                  return const Divider(height: 0.0, color: Colors.black);
                },
              ),
            ),
          ],
        ));
  }
}

class _AddNew extends GetView<EmergencyContactsController> {
  const _AddNew();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.addEmergencyContactFromFamilyMembers,
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
