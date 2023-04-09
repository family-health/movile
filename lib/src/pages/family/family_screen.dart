import 'package:flutter/material.dart';
import 'package:app/src/pages/family/widgets/summary_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FamilyScreen extends StatelessWidget {
  const FamilyScreen({Key? key}) : super(key: key);

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
            top: 45.0,
            left: 0.0,
            right: 0.0,
            child: SvgPicture.asset("assets/images/family/family.svg",
                height: 150.0, width: 150.0),
          )
        ],
      ),
    );
  }
}
