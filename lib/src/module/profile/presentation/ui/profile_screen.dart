import 'package:app/src/shared/presentation/logic/app_controller.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/health_data_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          const _ProfileHeader(),
          const _HearthResume(),
          const _HealthResume(),
          buildSignOutButton(),
        ]),
      ),
    );
  }

  Widget buildSignOutButton() {
    AppController appController = Get.find<AppController>();

    return Container(
      height: 60,
      margin: const EdgeInsets.only(left: 22.0, right: 22.0),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.black),
        onPressed: appController.logout,
        child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.logout, color: Colors.white),
          SizedBox(width: 10.0),
          Text("Sign out", style: TextStyle(color: Colors.white)),
        ]),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.find<AppController>();
    User? user = appController.user!;
    String age = "-";

    if (DateTime.tryParse(user.birth) != null) {
      int years = (DateTime.now().difference(DateTime.parse(user.birth)).inDays ~/ 365).toInt();
      age = years.toString();
    }


    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(children: [
            _buildAvatar(),
            const SizedBox(height: 10.0),
            _builName(),
            const SizedBox(height: 5.0),
            _buildEmail(),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _buildMesaure(text: "Hieght", value: "${user.height} cm", assetName: "assets/icons/png/filled/symbols/social_distancing_alt.png"),
            _buildMesaure(text: "Weight", value: "${user.weight} kg", assetName: "assets/icons/png/filled/people/exercise_weights.png"),
            _buildMesaure(text: "Years", value: "$age yrs", assetName: "assets/icons/png/filled/body/body.png"),
          ])
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 57.0,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: 55.0,
        backgroundColor: Colors.white,
        child: Image.asset("assets/images/avatar/male-2.png", height: 80),
      ),
    );
  }

  Widget _builName(){
    final AppController appController = Get.find<AppController>();

    TextStyle textStyle = const TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500);
    return Text("${appController.user!.name} ${appController.user!.lastname}", style: textStyle);
  }

  Widget _buildEmail(){
    final AppController appController = Get.find<AppController>();

    TextStyle textStyle = const TextStyle(color: Colors.black54, fontSize: 15.0);
    return Text(appController.user!.email, style: textStyle);
  }

  Widget _buildMesaure({required String text, required String value, required String assetName}) {
    return Row(
      children: [
        ImageIcon(AssetImage(assetName), color: Colors.black),
        const SizedBox(width: 5.0),
        Column(
          children: [
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(text, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

class _HearthResume extends StatelessWidget {
  const _HearthResume();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatedCircularChartState> chartKey = GlobalKey<AnimatedCircularChartState>();
    const List<CircularStackEntry> chartData = [
      CircularStackEntry([CircularSegmentEntry(33, Colors.black)]),
      CircularStackEntry([CircularSegmentEntry(100, Colors.black)]),
    ];

    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      padding: const EdgeInsets.all(20.0),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(children: [
        Expanded(
          flex: 1,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Today", style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 5.0),
            const Text("Budget 2600 Cal", style: TextStyle(fontWeight: FontWeight.w400)),
            const SizedBox(height: 15.0),
            AnimatedCircularChart(
              key: chartKey,
              size: const Size(130, 100),
              initialChartData: chartData,
              chartType: CircularChartType.Radial,
              edgeStyle: SegmentEdgeStyle.round,
              percentageValues: true,
              holeLabel: "1200",
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20.0),
            )
          ]),
        ),
        Container(width: 1, color: Colors.grey),
        const Expanded(
          flex: 1,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ImageIcon(AssetImage("assets/icons/png/filled/symbols/heart_cardiogram.png")),
              Text("Heart"),
            ]),
            SizedBox(height: 50.0),
            Column(children: [
              Text("93,4", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500)),
              Text("bpm", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.grey))
            ])
          ]),
        ),
      ]),
    );
  }
}

class _HealthResume extends StatelessWidget {
  const _HealthResume();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HealthDataCard(assetName: "assets/icons/png/filled/people/exercise_running.png", text: "Steps", value: "25 km"),
        HealthDataCard(assetName: "assets/icons/png/filled/devices/intravenous_bag.png", text: "Blood", value: "40 ml"),
        HealthDataCard(assetName: "assets/icons/png/filled/symbols/water_treatment.png", text: "Water", value: "10 lts"),
      ],
    );
  }
}