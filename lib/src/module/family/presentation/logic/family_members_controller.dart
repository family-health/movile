import 'package:app/src/module/family/data/datasources/family_provider.dart';
import 'package:app/src/module/family/domain/entities/family_member.dart';
import 'package:app/src/shared/data/models/api/response_api_model.dart';
import 'package:app/src/shared/presentation/logic/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamilyMembersController extends GetxController with StateMixin<List<FamilyMember>> {
  final AppController _appController = Get.find<AppController>();
  final FamilyProvider _familyProvider = FamilyProvider();

  Future fetchMembers() async {
    change(null, status: RxStatus.loading());
    ResponseApiModel<List<dynamic>> response = await _familyProvider.getAllFamilyByUserId(_appController.user!.id, _appController.token!);
    List<FamilyMember> data = [];
    if (response.data != null) {
      data = response.data!
          .map((e) => FamilyMember.fromMap(e))
          .where((member) => member.isVerified == true)
          .where((member) => member.isEmergency == false)
          .toList();
    }
    change(data, status: RxStatus.success());
  }

  void deleteMember(BuildContext context, String memberId) async {
    Future<bool?> questionDialog = showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Invitation'),
          content: const Text('This action delete the invitation'),
          actions: <Widget>[
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
            TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Delete')),
          ],
        );
      },
    );

    bool? questionResponse = await questionDialog;

    if (questionResponse == null || questionResponse == false) return;

    await _familyProvider.deleteById(memberId, _appController.token!);
    fetchMembers();
  }
}
