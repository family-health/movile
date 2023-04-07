import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String title;

  const OptionCard({Key? key, required this.title}) : super(key: key);

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
