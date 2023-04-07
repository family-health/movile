import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String assetName;

  const HeaderImage({Key? key, required this.assetName}) : super(key: key);

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
