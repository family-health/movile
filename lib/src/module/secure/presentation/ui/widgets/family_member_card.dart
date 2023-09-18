import 'package:app/src/module/family/domain/entities/family_member.dart';
import 'package:flutter/material.dart';

class FamilyMemberCard extends StatelessWidget {
  final FamilyMember familyMember;
  const FamilyMemberCard(this.familyMember, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black)),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Flexible(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: const Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(familyMember.avatar!),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${familyMember.name} ${familyMember.lastName}",style: const TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(3))
                  ),
                  child: Text("${familyMember.relation}", style: const TextStyle(color: Colors.white)),
                ),
                Text("${familyMember.phone}",style: const TextStyle(decoration: TextDecoration.underline)),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
