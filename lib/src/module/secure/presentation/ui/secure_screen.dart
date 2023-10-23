import 'package:app/src/module/secure/presentation/logic/secure_router_controller.dart';
import 'package:app/src/module/secure/presentation/logic/wearable_controller.dart';
import 'package:app/src/module/secure/presentation/ui/widgets/secure_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SecureScreen extends GetView<WearableController> {
  const SecureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WearableController());
    Get.put(SecureRouterController());

    return const SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center, children: [
          _ShieldAsset(),
          _Menu(),
        ]),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu();

  @override
  Widget build(BuildContext context) {
    SecureRouterController secureRouterController = Get.find<SecureRouterController>();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            GestureDetector(
              onTap: secureRouterController.navigateToEmergencyContacts,
              child: const SecureOption(text: "Emergency Contacts", assetPath: "assets/icons/png/outline/objects/phone.png"),
            ),
            const SecureOption(text: "Pill Reminder", assetPath: "assets/icons/png/outline/medications/medicines.png"),
          ]),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SecureOption(text: "Notifications Settings", assetPath: "assets/icons/png/outline/symbols/ui_preferences.png"),
            SecureOption(text: "Health Permissions", assetPath: "assets/icons/png/outline/symbols/heart.png"),
          ]),
        ],
      ),
    );
  }
}

class _ShieldAsset extends StatelessWidget {
  const _ShieldAsset();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/shield.json',
        width: 300,
        height: 300,
        fit: BoxFit.fill,
      ),
    );
  }
}