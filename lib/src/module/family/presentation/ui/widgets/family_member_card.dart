import 'package:app/src/module/family/domain/entities/family_member.dart';
import 'package:flutter/material.dart';

class FamilyMemberCard extends StatelessWidget {
  final FamilyMember member;
  const FamilyMemberCard(this.member, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black, width: 1)),
      child: ListTile(
          leading: const _Avatar(),
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
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black,
      radius: 26.0,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        radius: 25.0,
        child: ClipOval(child: Image.asset("assets/images/avatar/male-1.png", height: 45.0)),
      ),
    );
  }
}
