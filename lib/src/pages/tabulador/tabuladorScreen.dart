// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './tabuladorController.dart';


class TabulatorScreen extends StatelessWidget {
  const TabulatorScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.put(TabulatorController());

    return GetBuilder<TabulatorController>(builder: (controller) {
      return Scaffold(
        /// [PageView] used to change beetween tabs without horizontal scroll.
        //// ? Need [PageController] to work.
        //// ? If [PageView] is used comment [TabBarView] inside [body] param.
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.getPageController,
          children: controller.getScreens,
        ),

        /// [TabBarView] used to change beetween tabs without horizontal scroll.
        //// ? Need [TabController] to work.
        //// ? If [TabBarView] is used comment [PageView] inside [body] param.
        // body: TabBarView(
        //   physics: NeverScrollableScrollPhysics(),
        //   controller: controller.getTabController,
        //   children: controller.getScreens,
        // ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.getTabController.index,
          items: controller.getBottomNavigationBarItems,
          onTap: controller.onTap,
        ),
      );
    });
  }
}
