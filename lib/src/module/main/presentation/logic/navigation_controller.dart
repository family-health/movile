import 'package:get/get.dart';

class NavigationController extends GetxController {
  int currentIndex = 0;

  void onTap(int index){
    currentIndex = index.toInt();
    update();
  }
}