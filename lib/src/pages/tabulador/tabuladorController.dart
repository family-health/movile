// ignore_for_file: file_names

import 'package:app/src/pages/dashboard/dashboard_screen.dart';
import '../family/familyScreen.dart';
import '../profile/profileScreen.dart';
import 'package:app/src/pages/security/securityScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


/*
..######...#######..##....##.########.########...#######..##.......##.......########.########.
.##....##.##.....##.###...##....##....##.....##.##.....##.##.......##.......##.......##.....##
.##.......##.....##.####..##....##....##.....##.##.....##.##.......##.......##.......##.....##
.##.......##.....##.##.##.##....##....########..##.....##.##.......##.......######...########.
.##.......##.....##.##..####....##....##...##...##.....##.##.......##.......##.......##...##..
.##....##.##.....##.##...###....##....##....##..##.....##.##.......##.......##.......##....##.
..######...#######..##....##....##....##.....##..#######..########.########.########.##.....##
*/



class TabulatorController extends GetxController with GetSingleTickerProviderStateMixin {
  static const List<Widget> _screens = [DashboardScreen(), FamilyScreen(), SecurityScreen(), ProfileScreen()];
  static const List<BottomNavigationBarItem> _barItems = [
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
    BottomNavigationBarItem(icon: Icon(Icons.family_restroom), label: "Familia"),
    BottomNavigationBarItem(icon: Icon(Icons.security), label: "Seguridad"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Opciones"),
  ];
  static late TabController _tabController;
  static late PageController _pageController;

  /// Getters:
  /// [getScreens] get all screens
  /// [getBottomNavigationBarItems] get bottom icons
  /// [getTabController] get controller to tabs functionality
  /// [getPageController] get page controller to tabs functionality

  List<Widget> get getScreens => _screens;
  List<BottomNavigationBarItem> get getBottomNavigationBarItems => _barItems;
  TabController get getTabController => _tabController;
  PageController get getPageController => _pageController;

  @override
  void onInit() {
    super.onInit();
    _pageController = PageController(initialPage: 0);
    _tabController = TabController(length: _screens.length, initialIndex: 0, vsync: this);
  }

  @override
  void onClose() {
    super.onClose();
    _tabController.dispose();
    _pageController.dispose();
  }

  /// [onTap] function to refresh selected tab
  // ? update rebuild GetBuilder
  void onTap(int index) {
    _tabController.index = index;
    _pageController.jumpTo(index.toDouble());
    _pageController.jumpToPage(index);
    update();
  }
}
