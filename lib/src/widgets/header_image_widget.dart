import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String assetName;
  final double height;
  final double width;

  const HeaderImage(
      {Key? key,
      required this.assetName,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
