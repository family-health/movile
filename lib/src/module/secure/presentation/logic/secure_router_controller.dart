import 'package:get/get.dart';
import 'package:app/src/module/secure/presentation/ui/emergency_contacts_screen.dart';

class SecureRouterController extends GetxController {

  void navigateToEmergencyContacts(){
    Get.to(const EmergencyContactsScreen());
  }
}