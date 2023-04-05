import 'package:flutter/material.dart';

class SecurityCard extends StatelessWidget {
  final String title;
  const SecurityCard({super.key, required this.title});

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
