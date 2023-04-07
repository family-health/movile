import 'package:app/src/pages/settings/main/settings_main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsMainPage extends StatelessWidget {
  SettingsMainPage({Key? key}) : super(key: key);
  final SettingsMainController _con = Get.put(SettingsMainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Configuraciones")),
      body: ListView(children: [
        _optionCard("Perfil"),
        _optionCard("Dispositivos"),
        GestureDetector(
          onTap: () => _con.singOut(),
          child: _optionCard("Cerrar Sesion"),
        ),
      ]),
    );
  }

  Widget _optionCard(String title) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.settings),
        trailing: const Icon(Icons.keyboard_arrow_right),
        title: Text(title),
      ),
    );
  }
}
