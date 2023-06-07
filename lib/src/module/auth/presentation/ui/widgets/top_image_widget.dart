import 'package:flutter/material.dart';

class TopImage extends StatelessWidget {
  final String assetName;
  const TopImage({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white70,
        image: DecorationImage(
          image: AssetImage(assetName),
        ),
      ),
    );
  }
}