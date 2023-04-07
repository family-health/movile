import 'package:flutter/material.dart';

class SecurityCard extends StatelessWidget {
  final String title;

  const SecurityCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.medical_services),
        trailing: const Icon(Icons.keyboard_arrow_right),
        title: Text(title),
      ),
    );
  }
}
