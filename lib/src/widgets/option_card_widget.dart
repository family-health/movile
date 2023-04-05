import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String title;
  const OptionCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.settings),
        trailing: const Icon(Icons.keyboard_arrow_right),
        title: Text(title),
      ),
    );
  }
}
