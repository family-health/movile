import 'package:app/src/features/menu/ui/notifiers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);
  final MenuController _con = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Configuraciones")),
      body: ListView(children: [
        GestureDetector(
          onTap: () => _con.goToProfileInfo(),
          child: _optionCard("Perfil", Icons.person),
        ),
        _optionCard("Dispositivos", Icons.devices),
        GestureDetector(
          onTap: () => _con.singOut(),
          child: _optionCard("Cerrar Sesion", Icons.power_settings_new),
        ),
      ]),
    );
  }

  Widget _optionCard(String title, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        trailing: const Icon(Icons.keyboard_arrow_right),
        title: Text(title),
      ),
    );
  }
}
