import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String assetName;
  const HeaderImage({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white70,
        image: DecorationImage(
          image: AssetImage(assetName),
        ),
        // image: DecorationImage(image: AssetImage(), fit: BoxFit.cover),
      ),
    );
  }
}
