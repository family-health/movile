// ignore_for_file: file_names

import 'package:app/src/widgets/security_card.dart';
import 'package:flutter/material.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey.shade100,
          height: MediaQuery.of(context).size.height * 0.35,
          child: const Center(
            child: CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.blue,
              child: Icon(Icons.security, size: 100.0, color: Colors.white),
            ),
          ),
        ),
        const SecurityCard(title: "Asistencia Medica"),
        const SecurityCard(title: "Contactos de Emergencia"),
      ],
    );
  }
}
