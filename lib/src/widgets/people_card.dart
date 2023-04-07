import 'package:flutter/material.dart';

class PeopleCard extends StatelessWidget {
  final String image;
  final String name;
  final String email;

  const PeopleCard(
      {Key? key, required this.image, required this.name, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(15.0),
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.grey[100],
          child: Image.asset(image),
        ),
        title: Text(name,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500)),
        subtitle: Text(email),
      ),
    );
  }
}
