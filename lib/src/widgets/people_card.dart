import 'package:app/src/pages/family/list_families/family_list_families_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeopleCard extends StatelessWidget {
  final FamilyListFamiliesController _con =
      Get.put(FamilyListFamiliesController());

  final String image;
  final String name;
  final String email;
  final bool activeOptions;
  final String id;

  PeopleCard(
      {Key? key,
      required this.image,
      required this.activeOptions,
      required this.id,
      required this.name,
      required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(15.0),
        leading: _avatar(),
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
        ];
      },
      onSelected: (selection) => _con.menuAction(selection, id, context),
    );
  }

  Widget _avatar() {
    return CircleAvatar(
      radius: 30.0,
      backgroundColor: Colors.grey[100],
      child: Image.asset(image),
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
