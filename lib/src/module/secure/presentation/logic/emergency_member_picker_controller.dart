import 'package:app/src/module/family/data/datasources/family_provider.dart';
import 'package:app/src/module/family/domain/entities/family_member.dart';
import 'package:app/src/shared/data/models/api/response_api_model.dart';
import 'package:app/src/shared/presentation/logic/app_controller.dart';
import 'package:get/get.dart';

class EmergencyMemberPickerController extends GetxController {
  final AppController _appController = Get.find<AppController>();
  final FamilyProvider _familyProvider = FamilyProvider();

  late RxList<FamilyMember> data = <FamilyMember>[].obs;

  @override
  void onInit() async {
    super.onInit();
    data.value = await fetchFamilyMembers();
  }

  Future<List<FamilyMember>> fetchFamilyMembers() async {
    ResponseApiModel<List<dynamic>> response = await _familyProvider.getAllFamilyByUserId(_appController.user!.id, _appController.token!);
    if (response.data != null) {
      List<FamilyMember> data = response.data!
          .map((e) => FamilyMember.fromMap(e))
          .where((member) => member.isVerified == true)
          .where((member) => member.isEmergency == false)
          .toList();
      return data;
    }else{
      return [];
    }
  }
}
