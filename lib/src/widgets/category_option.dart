import 'package:flutter/material.dart';

class CategoryOption extends StatelessWidget {
  final Color color;

  const CategoryOption({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.0)),
      height: 100.0,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.white,
              height: 35.0,
              width: 35.0,
              child:
                  const Icon(Icons.monitor_heart_outlined, color: Colors.blue),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Health Tracking", style: TextStyle(color: Colors.white)),
                Icon(Icons.arrow_forward_ios_outlined,
                    size: 20.0, color: Colors.white),
              ],
            )
          ]),
    );
  }
}
