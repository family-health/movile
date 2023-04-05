import 'package:flutter/material.dart';

class MenuOption extends StatelessWidget {
  final String title;
  const MenuOption({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade200, width: 0.5))),
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        leading: const Icon(Icons.person),
        trailing: Icon(Icons.arrow_forward_ios_sharp, size: 20.0, color: Colors.grey.shade400),
      ),
    );
  }

  void onTap() {
    print("onTap");
  }
}
