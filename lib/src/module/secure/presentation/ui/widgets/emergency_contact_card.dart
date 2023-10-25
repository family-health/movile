import 'package:app/src/module/family/domain/entities/family_member.dart';
import 'package:app/src/module/secure/domain/entities/emergency_contact.dart';
import 'package:app/src/module/secure/presentation/logic/emergency_contacts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EmergencyContactCard extends GetView<EmergencyContactsController> {
  final EmergencyContact contact;
  const EmergencyContactCard(this.contact, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      // decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black, width: 1)),
      decoration: const BoxDecoration(color: Colors.white),
      child: ListTile(
          leading: const _Avatar(),
          // trailing: const Icon(Icons.more_vert_rounded),
          trailing: IconButton(onPressed: () async {
            controller.removeEmergencyContact(context, FamilyMember.fromEmergencyContactModel(contact));
          }, icon: const Icon(Icons.delete, color: Colors.black,)),
          title: Text("${contact.name} ${contact.lastName}", style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
          subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              const Icon(Icons.numbers, color: Colors.black),
              const SizedBox(width: 3.0),
              Text("${contact.phone}", style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
            ],),
          ])),
    );
  }
}


class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
            backgroundColor: Colors.black,
            radius: 26.0,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              radius: 25.0,
              child: ClipOval(child: Image.asset("assets/images/avatar/male-1.png", height: 45.0)),
            )),
       CircleAvatar(
        radius: 26,
        backgroundColor: Colors.black.withOpacity(0.80),
        child: const Text("SOS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
       )
      ],
    );
  }
}
