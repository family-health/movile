import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/pages/home/home_controller.dart';
import 'package:app/src/widgets/custom_animated_bottom_bar.dart';
import 'package:app/src/pages/dashboard/dashboard_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController _con = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((() => IndexedStack(
            index: _con.indexTab.value,
            children: [DashboardScreen(), DashboardScreen()],
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
                icon: const Icon(Icons.list),
                activeColor: Colors.white,
                inactiveColor: Colors.black,
                title: const Text("Mis pedidos")),
            // BottomNavyBarItem(
            //     icon: const Icon(Icons.person),
            //     activeColor: Colors.white,
            //     inactiveColor: Colors.black,
            //     title: const Text("Perfil")),
          ],
        ));
  }
}
