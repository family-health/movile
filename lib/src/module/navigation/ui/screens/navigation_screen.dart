// ignore_for_file: prefer_const_constructors

import 'package:app/src/module/circle/ui/screens/circle_screen.dart';
import 'package:app/src/module/dashboard/ui/ui/screens/dashboard_screen.dart';
import 'package:app/src/module/menu/ui/screens/menu_screen.dart';
import 'package:app/src/module/navigation/ui/notifiers/navigation_controller.dart';
import 'package:app/src/module/navigation/ui/widgets/animated_bottom_bar.dart';
import 'package:app/src/module/security/ui/screens/security_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({Key? key}) : super(key: key);
  final NavigationController _con = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((() => IndexedStack(
            index: _con.indexTab.value,
            children: [
              DashboardScreen(),
              FamilyScreen(),
              const SecurityScreen(),
              const MenuScreen()
            ],
          ))),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _bottomBar() {
    return Obx(() => AnimatedBottomBar(
          containerHeight: 70,
          backgroundColor: Colors.blue,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          selectedIndex: _con.indexTab.value,
          onItemSelected: (index) => _con.changeTab(index),
          items: [
            BottomNavyBarItem(
                icon: const Icon(Icons.dashboard),
                activeColor: Colors.white,
                inactiveColor: Colors.black,
                title: const Text("Dasboard")),
            BottomNavyBarItem(
                icon: const Icon(Icons.family_restroom),
                activeColor: Colors.white,
                inactiveColor: Colors.black,
                title: const Text("Familia")),
            BottomNavyBarItem(
                icon: const Icon(Icons.security),
                activeColor: Colors.white,
                inactiveColor: Colors.black,
                title: const Text("Seguridad")),
            BottomNavyBarItem(
                icon: const Icon(Icons.settings),
                activeColor: Colors.white,
                inactiveColor: Colors.black,
                title: const Text("Opciones")),
          ],
        ));
  }
}
