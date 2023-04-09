import 'package:app/src/pages/family/family_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FamilyPage extends StatelessWidget {
  FamilyPage({Key? key}) : super(key: key);
  final FamilyController _con = Get.put(FamilyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: Colors.blue,
          ),
          Positioned(
            top: 45.0,
            left: 0.0,
            right: 0.0,
            child: SvgPicture.asset("assets/images/family/family.svg",
                height: 150.0, width: 150.0),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: _sumamary(context),
          ),
        ],
      ),
    );
  }

  Widget _sumamary(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [_boxForm(context)],
          )
        ],
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            30), // Ajusta el valor para cambiar la curvatura
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
        ],
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: MediaQuery.of(context).size.height * 0.50,
      child: SingleChildScrollView(
        child: Column(children: [
          _textYourInfo(),
          _textFieldName(),
          _textFieldLastName(),
          _textFieldPhone(),
          _textFieldEmail(),
          _textFieldRelacions(),
          _buttonCreate(context)
        ]),
      ),
    );
  }

  Widget _buttonCreate(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () => _con.createFamily(context),
          child: const Text(
            "Crear",
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _con.nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            hintText: "Nombre", prefixIcon: Icon(Icons.person)),
      ),
    );
  }

  Widget _textFieldLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _con.lastNameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            hintText: "Apellido", prefixIcon: Icon(Icons.person_4_outlined)),
      ),
    );
  }

  Widget _textFieldPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _con.phoneController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            hintText: "Telefono", prefixIcon: Icon(Icons.phone)),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: "Email", prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _textFieldRelacions() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _con.relationController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            hintText: "Relacion", prefixIcon: Icon(Icons.person_2)),
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
        margin: const EdgeInsets.only(top: 30, bottom: 20),
        child: const Text(
          "Crear nuevo Familiar",
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ));
  }
}
