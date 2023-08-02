import 'package:app/src/module/auth/domain/enums/header_options.dart';
import 'package:app/src/module/auth/presentation/logic/register_router_controller.dart';
import 'package:app/src/module/common/presentation/ui/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/index.dart' as widgets;
import 'package:get/get.dart';

class RegisterScreen extends GetView<RegisterRouterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _RegisterHeader(),
          Expanded(child: _RegisterContent()),
          _RegisterBottom(),
        ]),
      ),
    );
  }
}

class _RegisterHeader extends RegisterScreen {
  const _RegisterHeader();

  @override
  Widget build(BuildContext context) {
    return widgets.LayoutHeader(
      image: "assets/images/auth/auth-register.png",
      title: "Create account",
      subtitle: "Now your Health are in one place, and always under control",
      options: HeaderOptions(dimension: HeaderDimension.big),
    );
  }
}

class _RegisterContent extends RegisterScreen {
  const _RegisterContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        CustomOutlinedButton.icon(
          onPressed: controller.navigateToCreateAccountScreen,
          label: "Continue with Email",
          icon: Image.asset("assets/images/auth/email-outlined.png", height: 35.0),
        ),
        CustomOutlinedButton.icon(
          onPressed: () => null,
          label: "Continue with Google",
          icon: Image.asset("assets/images/auth/google-outlined.png", height: 35.0),
        ),
        CustomOutlinedButton.icon(
          onPressed: () => null,
          label: "Continue with Apple",
          icon: Image.asset("assets/images/auth/apple-outlined.png", height: 35.0),
        ),
      ]),
    );
  }
}

class _RegisterBottom extends RegisterScreen {
  const _RegisterBottom();

  @override
  Widget build(BuildContext context) {
    return widgets.LayoutBottom(
      text: "Already have account?",
      span: "Login",
      onTap: controller.navigateToLoginScreen,
    );
  }
}