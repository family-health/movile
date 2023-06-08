import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const Header({super.key, required this.image, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      child: Column(
        children: [
          Flexible(flex: 3, child: _HeaderImage(assetName: image)),
          Flexible(flex: 1, child: _HeaderText(title: title, subtitle: subtitle))
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
    return Container(
      height: 250,
      decoration: getBoxDecoration(),
    );
  }

  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      color: Colors.white70,
      image: DecorationImage(image: AssetImage(assetName)),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [buildTilte(), buildSubtitle()],
    );
  }

  Widget buildTilte() {
    TextStyle style = const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
    return Text("Welcome", style: style);
  }

  Widget buildSubtitle(){
    TextStyle style = const TextStyle(color: Colors.grey);
    return Text("to smart tracking health", style: style);
  }
}
