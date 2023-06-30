import 'package:flutter/material.dart';
import 'package:app/src/module/auth/domain/entities/header_options.dart';

export 'package:app/src/module/auth/domain/entities/header_options.dart';

class Header extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final HeaderOptions? options;

  const Header({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double layoutHeight = height * 0.40;
    double imageHeight = height * 0.30;
    double titleHeight = height * 0.10;

    //?[HeaderOptions] setters.
    if (options != null) {
      if (options!.dimension == HeaderDimension.big) {
        layoutHeight = height * 0.50;
        imageHeight = height * 0.40;
        titleHeight = height * 0.10;
      }
    }

    return SizedBox(
      height: layoutHeight,
      child: Column(
        children: [
          SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: Center(child: _HeaderImage(assetName: image)),
          ),
          SizedBox(
            height: titleHeight,
            width: double.infinity,
            child: _HeaderText(title: title, subtitle: subtitle),
          ),
        ],
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  final String assetName;
  const _HeaderImage({required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Image(
        image: AssetImage(assetName),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  final String title;
  final String subtitle;
  const _HeaderText({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTilte(),
        const SizedBox(height: 8.0),
        buildSubtitle(),
      ],
    );
  }

  Widget buildTilte() {
    TextStyle style = const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
    return Text(title, style: style);
  }

  Widget buildSubtitle(){
    TextStyle style = const TextStyle(color: Colors.black54);
    return Text(subtitle, style: style);
  }
}
