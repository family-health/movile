// ignore_for_file: file_names
import 'package:app/src/features/security/ui/widgets/security_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey.shade100,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Center(
            child: SvgPicture.asset(
              "assets/images/security/security.svg",
              height: 150,
              width: 150,
            ),
          ),
        ),
        const SecurityCard(title: "Asistencia Medica"),
        const SecurityCard(title: "Contactos de Emergencia"),
      ],
    );
  }
}
