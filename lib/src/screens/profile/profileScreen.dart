// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../widgets/menu_option.dart';
import '../../widgets/category_option.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        _Header(),
        SizedBox(height: 15.0),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _Menu(),
        ),
      ]),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    TextStyle nameStyle = const TextStyle(color: Colors.white, fontSize: 22.0);
    TextStyle emailStyle = TextStyle(color: Colors.grey[300], fontSize: 18.0);

    return Container(
      color: Theme.of(context).primaryColor,
      height: MediaQuery.of(context).size.height * 0.30,
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
        CircleAvatar(
          radius: 60.0,
          backgroundColor: Colors.grey[50],
          child: Image.asset(
            "assets/images/avatar/male-1.png",
            height: 80,
          ),
        ),
        const SizedBox(height: 5),
        Text("Joseph Garcia", style: nameStyle),
        const SizedBox(height: 5),
        Text("josephdgb1996@gmail.com", style: emailStyle),
      ]),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu();

  @override
  Widget build(BuildContext context) {
   

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text("Categorias", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700)),
      const SizedBox(height: 10),
      Table(
        // border: TableBorder.all(width: 10.0),
        children:  [
          TableRow(children: [
            TableCell(
                child: Padding(
              padding: EdgeInsets.all(5.0),
              child: CategoryOption(color: Colors.blue),
            )),
            TableCell(
                child: Padding(
              padding: EdgeInsets.all(5.0),
              child: CategoryOption(color: Colors.orange),
            )),
          ]),
          TableRow(children: [
            TableCell(
                child: Padding(
              padding: EdgeInsets.all(5.0),
              child: CategoryOption(color: Colors.red),
            )),
            TableCell(
                child: Padding(
              padding: EdgeInsets.all(5.0),
              child: CategoryOption(color: Colors.cyan),
            )),
          ]),
        ],
      ),
      const MenuOption(title: "Grupos familiares"),
      const MenuOption(title: "Dispositivos conectados"),
      const SizedBox(height: 10.0),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.10,
        width: double.infinity,
        // color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            onPressed: null,
            child: const Text("Cerrar sesion"),
          ),
        ),
      ),
    ]);
  }
}
