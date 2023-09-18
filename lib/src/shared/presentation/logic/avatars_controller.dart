import 'package:get/get.dart';

class AvatarsController extends GetxController {
  selectAvatar(String assetPath){
     Get.back<String>(result: assetPath);
  }
}