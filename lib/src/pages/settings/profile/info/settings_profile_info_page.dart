import 'package:app/src/pages/settings/profile/info/settings_profile_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsProfileInfoPage extends StatelessWidget {
  SettingsProfileInfoPage({Key? key}) : super(key: key);
  final SettingsProfileInfoController _con =
      Get.put(SettingsProfileInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _imagenUser(context),
          _buttonSignOut(),
          _buttonBack()
        ],
      ),
    ));
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15, offset: Offset(0, 0.75))
      ], color: Colors.white),
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.37, left: 50, right: 50),
      height: MediaQuery.of(context).size.height * 0.45,
      child: SingleChildScrollView(
        child: Column(children: [
          _textYourName(),
          _textEmail(),
          _textPhone(),
          _buttonUpdate(context),
        ]),
      ),
    );
  }

  Widget _imagenUser(BuildContext context) {
    return SafeArea(
      child: Container(
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            backgroundImage: _con.user.value.avatar != null
                ? NetworkImage(_con.user.value.avatar!)
                : const AssetImage("assets/images/avatar/user_profile.png")
                    as ImageProvider,
            // backgroundImage: _con.user.image != null ? NetworkImage(_con.user.image) : const AssetImage("assets/img/user_profile.png"),
            radius: 85,
            backgroundColor: Colors.white,
          )),
    );
  }

  Widget _textYourName() {
    return Container(
        margin: const EdgeInsets.only(top: 25),
        child: ListTile(
          leading: const Icon(Icons.person),
          title: Text(
              "${_con.user.value.name!.toUpperCase()} ${_con.user.value.lastname!.toUpperCase()}"),
          subtitle: const Text("Nombre de usuario"),
        ));
  }

  Widget _textEmail() {
    return ListTile(
      leading: const Icon(Icons.email),
      title: Text(_con.user.value.email ?? ""),
      subtitle: const Text("email"),
    );
  }

  Widget _textPhone() {
    return ListTile(
      leading: const Icon(Icons.phone),
      title: Text(_con.user.value.phone ?? ""),
      subtitle: const Text("telefono"),
    );
  }

  Widget _buttonUpdate(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () => _con.goToProfileUpdate(),
          child: const Text(
            "Actualizar Datos",
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      color: Colors.blue,
    );
  }

  Widget _buttonBack() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(left: 20, top: 3),
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

  Widget _buttonSignOut() {
    return SafeArea(
        child: Container(
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(right: 20, top: 3),
      child: IconButton(
        hoverColor: Colors.white,
        icon: const Icon(
          Icons.power_settings_new,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () => _con.singOut(),
      ),
    ));
  }
}
