import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/pages/auth/singUp/singup_controller.dart';

class SingnUpPage extends StatelessWidget {
  SingnUpPage({Key? key}) : super(key: key);
  final SingUpController _con = Get.put(SingUpController());

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
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.2, left: 35, right: 35),
      height: MediaQuery.of(context).size.height * 0.7,
      child: SingleChildScrollView(
        child: Column(children: [
          _textYourInfo(),
          _textFieldName(),
          _textFieldLastName(),
          _textFieldPhone(),
          _textFieldEmail(),
          _textFieldPassword(context),
          _textFieldRepeatPassword(context),
          _buttonregister(context),
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
  //               child: GetBuilder<SingUpController>(
  //                 builder: (value) => CircleAvatar(
  //                   backgroundImage: _con.imageFile != null
  //                       ? FileImage(_con.imageFile!)
  //                       : const AssetImage(
  //                               "assets/images/avatar/user_profile.png")
  //                           as ImageProvider,
  //                   radius: 60,
  //                   backgroundColor: Colors.white,
  //                 ),
  //               ))),
  //     ),
  //   );
  // }

  Widget _buttonregister(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () => _con.register(context),
          child: const Text(
            "Registrar",
            style: TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: "Correo electronico", prefixIcon: Icon(Icons.email)),
      ),
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

  Widget _textFieldPassword(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Obx(
          () => TextField(
              controller: _con.passwordController,
              keyboardType: TextInputType.text,
              obscureText: _con.obscureTextPassword.value,
              decoration: InputDecoration(
                hintText: "Contraseña",
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _con.obscureTextPassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () => _con.toggleObscurePaswword(),
                ),
              )),
        ));
  }

  Widget _textFieldRepeatPassword(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Obx(
          () => TextField(
              controller: _con.repeactPasswordController,
              keyboardType: TextInputType.text,
              obscureText: _con.obscureTextRepeactPassword.value,
              decoration: InputDecoration(
                hintText: "Confirmar contraseña",
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _con.obscureTextRepeactPassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () => _con.toggleObscureRepeactPaswword(),
                ),
              )),
        ));
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

  Widget buildSingnUpWithGoogle() {
    return ElevatedButton.icon(
      icon: Image.asset("assets/images/auth/google.png", width: 40, height: 40),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10.0),
        backgroundColor: Colors.white,
        minimumSize: const Size.fromHeight(50),
      ),
      label: const Text("Sign in with google",
          style: TextStyle(color: Colors.black)),
    );
  }
}
