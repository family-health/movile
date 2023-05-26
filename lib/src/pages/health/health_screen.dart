import 'package:app/src/pages/health/health_controller.dart';
import 'package:app/src/pages/health/health_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HealthController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: authorize, child: const Text("Authorize")),
            TextButton(onPressed: fetchData, child: const Text("Fetch data")),
            TextButton(onPressed: ()=> viewData(context), child: const Text("View data")),
          ],
        ),
      ),
    );
  }

  void authorize(){
    final HealthController controller = Get.find();
    controller.authroize();
  }

  void fetchData(){
    final HealthController controller = Get.find();
    controller.fetchData();
  }

  void viewData(BuildContext context){
    // ignore: avoid_print
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HealthViewScreen()),
  );
  }
}