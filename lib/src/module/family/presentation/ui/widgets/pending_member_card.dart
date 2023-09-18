// ignore_for_file: avoid_print

import 'package:app/src/module/family/domain/entities/family_member.dart';
import 'package:flutter/material.dart';

class PendingMemberCard extends StatelessWidget {
  final FamilyMember member;
  final void Function()? deleteCallback;
  const PendingMemberCard(this.member, {super.key, this.deleteCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black, width: 1)),
      child: ListTile(
          leading:  _Avatar(member.avatar),
          title: Text("${member.name} ${member.lastName}", style: const TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("${member.email}"),
            const SizedBox(height: 5.0),
            Text("${member.phone}"),
            const SizedBox(height: 5.0),
            Row(
              children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.black)),
                onPressed: deleteCallback, child: const Text("Remove")
              ),
              const SizedBox(width: 10.0),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.black),
                onPressed: null,
                child: const Text("Resend Invitation", style: TextStyle(color: Colors.white)),
              ),
            ]),
          ])),
    );
  }
}


class _Avatar extends StatelessWidget {
  final String? avatar;
  const _Avatar(this.avatar);

  @override
  Widget build(BuildContext context) {
    String? assetPath = "assets/images/avatar/male-1.png";
    assetPath = (avatar != null) ? avatar : "assets/images/avatar/male-1.png";

    return CircleAvatar(
      backgroundColor: Colors.black,
      radius: 26.0,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade100,
        radius: 25.0,
        child: ClipOval(child: Image.asset(assetPath!, height: 45.0)),
      ),
    );
  }
}
