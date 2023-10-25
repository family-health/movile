import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Empty extends StatelessWidget {
  final String title;
  final String message;
  const Empty({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = const TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 18.0);
    TextStyle messageStyle = const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 15.0);

    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Lottie.asset(
          'assets/lottie/empty-box.json',
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 8.0),
        Text(title, style: titleStyle),
        const SizedBox(height: 3.0),
        Text(message, style: messageStyle, textAlign: TextAlign.center),
      ]),
    );
  }
}
