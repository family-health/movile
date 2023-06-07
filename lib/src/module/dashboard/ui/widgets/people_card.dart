import 'package:app/src/module/dashboard/ui/notifiers/family_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeopleCard extends StatelessWidget {
  final FamilyListController _con =
      Get.put(FamilyListController());

  final String image;
  final String name;
  final String email;
  final bool activeOptions;
  final String id;
  final bool isVerified;

  PeopleCard(
      {Key? key,
      required this.image,
      required this.activeOptions,
      required this.id,
      required this.name,
      required this.isVerified,
      required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(15.0),
        leading: isVerified ? _verified() : _noVerified(),
        title: _title(),
        subtitle: _subtitle(),
        trailing: activeOptions
            ? _menu(context)
            : null, // Si active_options es falso, no muestra el PopupMenuButton
      ),
    );
  }

  Widget _menu(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          const PopupMenuItem(
            value: 'Editar',
            child: Text('Editar'),
          ),
          const PopupMenuItem(
            value: 'Eliminar',
            child: Text('Eliminar'),
          ),
          if (!isVerified) // Mostrar solo si isVerified es true
            const PopupMenuItem(
              value: 'Invitar',
              child: Text('Enviar invitación'),
            ),
        ];
      },
      onSelected: (selection) => _con.menuAction(selection, id, context, email),
    );
  }

  Widget _noVerified() {
    return Tooltip(
      message: 'Este familar no ha sido verificado!',
      decoration: BoxDecoration(
        color: Colors.orange, // Establecer el color de fondo
        borderRadius:
            BorderRadius.circular(8), // Opcional: Agregar bordes redondeados
      ),
      preferBelow: false,
      child: SizedBox(
        width: 40,
        height: 40,
        child: IconButton(
          icon: const Icon(
            Icons.info,
            size: 33,
            color: Colors.orange,
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _verified() {
    return Tooltip(
      message: 'Familar verificado correctamente!',
      decoration: BoxDecoration(
        color: Colors.green, // Establecer el color de fondo
        borderRadius:
            BorderRadius.circular(8), // Opcional: Agregar bordes redondeados
      ),
      preferBelow: false,
      child: SizedBox(
        width: 40,
        height: 40,
        child: IconButton(
          icon: const Icon(
            Icons.check_circle,
            size: 33,
            color: Colors.green,
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _title() {
    return Text(name,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500));
  }

  Widget _subtitle() {
    return Text(email);
  }
}
