import 'package:app/src/module/family/domain/entities/family_member.dart';
import 'package:app/src/module/family/presentation/logic/family_members_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamilyMemberCard extends GetView<FamilyMembersController> {
  final FamilyMember member;
  const FamilyMemberCard(this.member, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black, width: 1)),
      child: ListTile(
          leading: _Avatar(member.avatar!),
          trailing: IconButton(onPressed: (){
            //delete member
            controller.deleteMember(context, member.id!);
          }, icon: const Icon(Icons.delete, color: Colors.black)),
          title: Text("${member.name} ${member.lastName}", style: const TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("${member.email}"),
            const SizedBox(height: 5.0),
            Text("${member.phone}"),
            const SizedBox(height: 5.0),
          ])),
    );
  }
}


class _Avatar extends StatelessWidget {
  final String path;
  const _Avatar(this.path);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black,
      radius: 26.0,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        radius: 25.0,
        child: ClipOval(child: Image.asset(path, height: 45.0)),
      ),
    );
  }
}
