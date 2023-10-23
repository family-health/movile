// import 'package:app/src/module/home/home_screen.dart';
// import 'package:app/src/module/family/presentation/ui/family_screen.dart';
// ignore_for_file: unused_local_variable

import 'package:app/src/module/family/presentation/ui/members_screen.dart';
import 'package:app/src/module/health/presentation/ui/health_screen.dart';
import 'package:app/src/module/main/presentation/logic/navigation_controller.dart';
import 'package:app/src/module/profile/presentation/ui/profile_screen.dart';
import 'package:app/src/module/secure/presentation/ui/secure_screen.dart';
import 'package:app/src/shared/presentation/logic/workmanager_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WorkmanagerController workmanagerController = Get.find<WorkmanagerController>();
    //todo: this cause permission error if not found
    // workmanagerController.startUploadHealthDataPointsTask();

    return GetBuilder<NavigationController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: controller.currentIndex,
          children: const [
            HealthScreen(),
            MembersScreen(),
            SecureScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex,
          backgroundColor: Colors.white,
          // showSelectedLabels: false,
          onTap: controller.onTap,
          items: const [
            BottomNavigationBarItem(
              label: "Health",
              icon: ImageIcon(AssetImage("assets/icons/png/outline/body/heart.png"), size: 30.0),
              activeIcon: ImageIcon(AssetImage("assets/icons/png/filled/body/heart.png"), size: 30.0),
            ),
            BottomNavigationBarItem(
              label: "Family",
              icon: ImageIcon(AssetImage("assets/icons/png/outline/places/home.png"), size: 30.0),
              activeIcon: ImageIcon(AssetImage("assets/icons/png/filled/places/home.png"), size: 30.0),
            ),
            BottomNavigationBarItem(
              label: "Secure",
              icon: ImageIcon(AssetImage("assets/icons/png/outline/symbols/health.png"), size: 30.0),
              activeIcon: ImageIcon(AssetImage("assets/icons/png/filled/symbols/health.png"), size: 30.0),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: ImageIcon(AssetImage("assets/icons/png/outline/symbols/ui_user_profile.png"), size: 30.0),
              activeIcon: ImageIcon(AssetImage("assets/icons/png/filled/symbols/ui_user_profile.png"), size: 30.0),
            ), // electedItemColor: Colors.black,
          ],
        ),
      );
    });
  }
}
