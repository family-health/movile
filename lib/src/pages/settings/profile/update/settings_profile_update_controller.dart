import 'dart:convert';
import 'dart:io';
import 'package:app/src/models/responseApi.dart';
import 'package:app/src/models/user.dart';
import 'package:app/src/pages/settings/profile/info/settings_profile_info_controller.dart';
import 'package:app/src/providers/user_provider.dart';
import 'package:app/src/environment/environment.dart';
import 'package:app/src/utils/validate_inputs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class ClientProfileUpdateController extends GetxController {
  final UserProvider _userProvider = UserProvider();
  final SettingsProfileInfoController _settingsProfileInfoController =
      Get.find();
  User user = User.fromJson(GetStorage().read(Environment.USER_STORAGE));

  ImagePicker picker = ImagePicker();
  File? imageFile;

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  ClientProfileUpdateController() {
    nameController.text = user.name ?? "hhhhh";
    lastNameController.text = user.lastname ?? "";
    phoneController.text = user.phone ?? "";
  }

  void updateUser(BuildContext context) async {
    ProgressDialog progressDialog = ProgressDialog(context: context);

    String name = nameController.text.trim();
    String lastName = lastNameController.text.trim();
    String phone = phoneController.text.trim();

    if (isValidUpdateUserForm(name, lastName, phone)) {
      if (imageFile != null) {
        // User myUser = User(
        //     id: user.id,
        //     name: name,
        //     lastname: lastName,
        //     phone: phone,
        //     sessionToken: user.sessionToken);
        // Stream stream = await _userProvider.updateWithImage(myUser, imageFile!);
        // stream.listen((res) {
        //   progressDialog.close();
        //   ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));

        //   if (responseApi.success == true) {
        //     GetStorage().write(Environment.USER_STORAGE, responseApi.data);
        //     _clientProfileInfoController.user.value = User.fromJson(
        //         GetStorage().read(Environment.USER_STORAGE) ?? {});
        //     Get.snackbar("Actualizado!", responseApi.message ?? "");
        //   } else {
        //     Get.snackbar('Registro fallido', responseApi.message ?? '');
        //   }
        // });
      } else {
        progressDialog.show(max: 10, msg: "Actualizando usuario ...");

        User myUser = User(name: name, lastname: lastName, phone: phone);

        ResponseApi responseApi = await _userProvider.updateWithOutImage(
            myUser, user.id!, user.token!);

        Get.snackbar("Vuelva a Iniciar Session para ver los cambios!",
            responseApi.message ?? "");
      }

      progressDialog.close();
    }
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.gallery);
        },
        child: const Text(
          "Galeria",
          style: TextStyle(color: Colors.black),
        ));

    Widget cameraButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.camera);
        },
        child: const Text(
          "Camara",
          style: TextStyle(color: Colors.black),
        ));

    AlertDialog alertDialog = AlertDialog(
      title: const Text(
        "Selecciona una opcion",
        style: TextStyle(color: Colors.black),
      ),
      actions: [galleryButton, cameraButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  Future selectImage(ImageSource imageSource) async {
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }
}
