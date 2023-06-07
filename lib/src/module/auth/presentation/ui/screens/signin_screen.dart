import 'package:app/src/module/auth/presentation/logic/signin_controller.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/create_new_account_widget.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/signin_form_widget.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/top_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends GetView<SignInController>{
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());

    // return Scaffold(
    //   body: controller.obx(
    //     (state) => const Text("State"),
    //     onEmpty: Container(),
    //     onLoading: const Center(child: CircularProgressIndicator()),
    //     onError: (error) => const Text("Error"),
    //   ),
    // );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const TopImage(assetName: "assets/images/auth/login.png"),
          Container(color: Colors.red, height: 80, width: double.infinity, child: buildTitlte()),
          Expanded(child: Container(color: Colors.blue,child: const SignInForm())),
          const CreateNewAccount(),
        ],
      ),
    );
  }

  Widget buildTitlte(){
    TextStyle style = const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text("Welcome", style: style),
      const Text("to smart tracking health"),
    ],);
  }
}