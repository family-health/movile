import 'package:flutter/material.dart';

/*
.##......##.####.########...######...########.########
.##..##..##..##..##.....##.##....##..##..........##...
.##..##..##..##..##.....##.##........##..........##...
.##..##..##..##..##.....##.##...####.######......##...
.##..##..##..##..##.....##.##....##..##..........##...
.##..##..##..##..##.....##.##....##..##..........##...
..###..###..####.########...######...########....##...
*/

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.0,
      padding: const EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildProfileHeader(),
          const SizedBox(height: 30.0),
          buildFamilySumary(),
          const SizedBox(height: 30.0),
          buildFamilyTasks(),
        ],
      ),
    );
  }

  Widget buildProfileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              // minRadius: 20,
              // maxRadius: 40,
              radius: 20.0,
              backgroundColor: Colors.pink[500],
              child: Image.asset(
                "assets/images/avatar/male-1.png",
                height: 38.0,
              ),
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Joseph Garcia",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Text(
                  "Administrador",
                  style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
        const Icon(Icons.more_vert_rounded),
      ],
    );
  }

  Widget buildFamilySumary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Family Resume", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        const SizedBox(height: 10.0),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          buildSummaryItem(Colors.red),
          buildSummaryItem(Colors.orange),
          buildSummaryItem(Colors.pink),
        ]),
      ],
    );
  }

  Widget buildFamilyTasks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Family Health", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        const SizedBox(height: 10.0),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          buildTaskItem(Colors.red),
          buildTaskItem(Colors.orange),
        ]),
      ],
    );
  }

  Widget buildSummaryItem(
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: color,
      height: 100.0,
      width: 100.0,
    );
  }

  Widget buildTaskItem(Color color) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: color,
      height: 100.0,
      width: 160.0,
    );
  }
}
