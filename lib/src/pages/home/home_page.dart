import 'package:app/src/pages/family/familyScreen.dart';
import 'package:app/src/pages/security/securityScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/pages/home/home_controller.dart';
import 'package:app/src/widgets/custom_animated_bottom_bar.dart';
import 'package:app/src/pages/dashboard/dashboard_screen.dart';
import 'package:app/src/pages/settings/main/settings_main_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController _con = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((() => IndexedStack(
            index: _con.indexTab.value,
            children: [
              DashboardScreen(),
              FamilyScreen(),
              SecurityScreen(),
              SettingsMainPage()
            ],
          ))),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _bottomBar() {
    return Obx(() => CustomAnimatedBottomBar(
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
