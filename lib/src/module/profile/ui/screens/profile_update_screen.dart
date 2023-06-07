import 'package:app/src/module/profile/ui/notifiers/profile_update.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsProfileUpdatePage extends StatelessWidget {
  SettingsProfileUpdatePage({super.key});
  final ProfileUpdateController _con =
      Get.put(ProfileUpdateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context),
          // _imagenUser(context),
          _buttonBack()
        ],
      ),
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
      ], color: Colors.white),
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.30, left: 50, right: 50),
      height: MediaQuery.of(context).size.height * 0.50,
      child: SingleChildScrollView(
        child: Column(children: [
          _textYourInfo(),
          _textFieldName(),
          _textFieldLastName(),
          _textFieldPhone(),
          _buttonUpdate(context)
        ]),
      ),
    );
  }

  Widget _buttonBack() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(left: 25),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () => Get.back(),
      ),
    ));
  }

  // Widget _imagenUser(BuildContext context) {
  //   return SafeArea(
  //     child: Container(
  //       margin: const EdgeInsets.only(top: 40),
  //       alignment: Alignment.topCenter,
  //       child: GestureDetector(
  //           onTap: () {},
  //           child: GestureDetector(
  //               onTap: () => _con.showAlertDialog(context),
  //               child: GetBuilder<ClientProfileUpdateController>(
  //                 builder: (value) => CircleAvatar(
  //                   backgroundImage: _con.imageFile != null
  //                       ? FileImage(_con.imageFile!)
  //                       : _con.user.image != null
  //                           ? NetworkImage(_con.user.image!)
  //                           : const AssetImage("assets/img/user_profile.png")
  //                               as ImageProvider,
  //                   radius: 60,
  //                   backgroundColor: Colors.white,
  //                 ),
  //               ))),
  //     ),
  //   );
  // }

  Widget _buttonUpdate(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () => _con.updateUser(context),
          child: const Text(
            "Actualizar",
            style: TextStyle(color: Colors.black),
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
            hintText: "Apellido", prefixIcon: Icon(Icons.person_outline)),
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
            hintText: "teléfono", prefixIcon: Icon(Icons.phone)),
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
        margin: const EdgeInsets.only(top: 25, bottom: 50),
        child: const Text(
          "Ingresa esta información",
          style: TextStyle(color: Colors.black),
        ));
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      color: Colors.blue,
    );
  }
}
