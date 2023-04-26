import 'package:app/src/pages/dashboard/dashboard_controller.dart';
import 'package:app/src/widgets/people_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamilyCreateListFamiliesPage extends StatelessWidget {
  FamilyCreateListFamiliesPage({super.key});
  final DashboardController _con = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Familiares'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await _con.getAllFamilies();
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(child: _lista(context)),
          ),
        ),
      ),
    );
  }

  Widget _lista(BuildContext context) {
    return Obx(() {
      if (_con.families.isEmpty) {
        return Column(
          children: const [
            SizedBox(height: 40),
            Center(child: Text('Sin datos')),
          ],
        );
      } else {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: _con.families.length,
                itemBuilder: (context, index) {
                  final family = _con.families[index];
                  return PeopleCard(
                    key: Key(family.id!),
                    id: family.id!,
                    name: family.name ?? '',
                    email: family.email ?? '',
                    image: "assets/images/avatar/user_profile.png",
                  );
                },
              ),
            ],
          ),
        );
      }
    });
  }
}
