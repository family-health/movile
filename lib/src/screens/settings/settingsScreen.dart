// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:app/src/widgets/option_card_widget.dart';
import 'package:get/get.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Securidad")),
      body: ListView(children: [
        const OptionCard(title: "Perfil"),
        const OptionCard(title: "Dispositivos"),
        GestureDetector(
          onTap: null,
          child: const OptionCard(title: "Cerrar Sesion"),
        ),
      ]),
    );
  }
}
