import 'package:flutter/material.dart';

class HealthCard extends StatelessWidget {
  const HealthCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.monitor_heart_outlined, color: Colors.blue),
          SizedBox(height: 5.0),
          Text("Corazon", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
