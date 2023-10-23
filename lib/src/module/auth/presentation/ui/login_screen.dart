import 'package:app/src/module/auth/domain/enums/email_status.dart';
import 'package:app/src/module/auth/domain/enums/form_status.dart';
import 'package:app/src/module/auth/domain/enums/password_status.dart';
import 'package:app/src/module/auth/presentation/logic/login_facebook_controller.dart';
import 'package:app/src/module/auth/presentation/logic/login_router_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/src/module/auth/presentation/ui/widgets/auth_text_form_field.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/small_button.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/submit.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/text_divider.dart';

import 'package:app/src/module/auth/presentation/logic/login_apple_controller.dart';
import 'package:app/src/module/auth/presentation/logic/login_email_controller.dart';
import 'package:app/src/module/auth/presentation/logic/login_google_controller.dart';
import 'package:app/src/module/auth/presentation/ui/widgets/forgot_password.dart';

import 'package:app/src/module/auth/presentation/ui/ui_widgets.dart' as widgets;


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _LoginHeader(),
          Expanded(child: _LoginContent()),
          _LoginBottom(),
        ]),
      ),
    );
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    return const widgets.LayoutHeader(
      image: "assets/images/auth/auth-login.png",
      title: "Hi, Welcome Back!",
      subtitle: "Login to track your health data with us",
    );
  }
}

class _LoginContent extends StatelessWidget {
  const _LoginContent();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          buildEmailTextField(),
          buildPasswordTextField(),
          buildSubmit(),
          const TextDivider(text: "Or"),
          Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
            buildLoginWithFacebookButton(),
            const SizedBox(width: 10.0),
            buildLoginWithGoogleButton(),
            const SizedBox(width: 10.0),
            buildLoginWithAppleButton()
          ]),
        ]),
      ),
    );
  }

  Widget buildEmailTextField() {
    LoginEmailController controller = Get.find<LoginEmailController>();

    return AuthTextFormField(
      hintText: "example@domain.com",
      obscureText: false,
      onChanged: controller.updateEmail,
    );
  }

  Widget buildPasswordTextField() {
    LoginEmailController controller = Get.find<LoginEmailController>();

    return Column(
      children: [
        AuthTextFormField(
          hintText: "*********",
          obscureText: true,
          onChanged: controller.updatePassword,
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: ForgotPassword(),
        ),
      ],
    );
  }

  GetBuilder buildSubmit() {
    return GetBuilder<LoginEmailController>(builder: (controller) {
      FormStatus formStatus = controller.formStatus;
      EmailStatus emailStatus = controller.emailStatus;
      PasswordStatus passwordStatus = controller.passwordStatus;
      bool passwordCheck = (emailStatus == EmailStatus.valid) && (passwordStatus == PasswordStatus.valid);
      bool formCheck = (formStatus != FormStatus.loading);
      bool clickable = passwordCheck && formCheck;

      return Submit(
        onPressed: (clickable) ? controller.submit : null,
        label: "Submit",
      );
    });
  }

  Widget buildLoginWithFacebookButton() {
    LoginFacebookController controller = Get.find<LoginFacebookController>();

    return SmallButton(
      image: "assets/images/auth/facebook-black.png",
      onPressed: controller.submit,
    );
  }

  Widget buildLoginWithGoogleButton() {
    LoginGoogleController controller = Get.find<LoginGoogleController>();

    return SmallButton(
      image: "assets/images/auth/google-black.png",
      onPressed: controller.submit,
    );
  }

  Widget buildLoginWithAppleButton() {
    LoginAppleController controller = Get.find<LoginAppleController>();

    return SmallButton(
      image: "assets/images/auth/apple-black.png",
      onPressed: controller.submit,
    );
  }
}

class _LoginBottom extends GetView<LoginRouterController> {
  const _LoginBottom();

  @override
  Widget build(BuildContext context) {
    return widgets.LayoutBottom(
      text: "Don't have an account?",
      span: "Register",
      onTap: controller.navigateToRegisterScreen,
    );
  }
}