import 'package:flutter/material.dart';
import 'package:app/src/widgets/summary_widget.dart';

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blue,
          ),
          const Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Summary(),
          ),
          Positioned(
            top: 50.0,
            left: 0.0,
            right: 0.0,
            child: Image.asset("assets/images/family/summary.png",
                height: 250.0, width: 250.0),
          )
        ],
      ),
    );
  }
}
