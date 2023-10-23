import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/module/family/presentation/logic/invite_family_member_controller.dart';

class InviteMemberScreen extends GetView<InviteFamilyMemberController> {
  const InviteMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InviteFamilyMemberController());

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Invite Member", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            GestureDetector(onTap: controller.updateAvatar, child: const _MemberPhoto()),
            const SizedBox(height: 5.0),
            _buildNameTextField(),
            _buildSurnameTextField(),
            _buildEmailTextField(),
            _buildRelationTextField(),
            _buildPhoneTextField(),
            _buildSubmit(context),
          ]),
        ),
      ),
    );
  }

  InputBorder? _getInputBorder(){
     return const OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 1.5));
  }

  Color _getFillColor(){
    return Colors.white;
  }

  Widget _buildNameTextField() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: controller.updateName,
        decoration: InputDecoration(
          labelText: "Name",
          contentPadding: const EdgeInsets.all(20.0),
          prefixIcon: const Icon(Icons.person),
          border: _getInputBorder(),
          disabledBorder: _getInputBorder(),
          enabledBorder: _getInputBorder(),
          focusedBorder: _getInputBorder(),
          hintText: "example. Joseph",
          filled: true,
          fillColor: _getFillColor(),
        ),
      ),
    );
  }

  Widget _buildSurnameTextField() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: TextField(
        controller: null,
        keyboardType: TextInputType.text,
        onChanged: controller.updateSurname,
        decoration: InputDecoration(
          labelText: "Surname",
          contentPadding: const EdgeInsets.all(20.0),
          prefixIcon: const Icon(Icons.person),
          border: _getInputBorder(),
          disabledBorder: _getInputBorder(),
          enabledBorder: _getInputBorder(),
          focusedBorder: _getInputBorder(),
          hintText: "example. Garcia",
          filled: true,
          fillColor: _getFillColor(),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: TextField(
        controller: null,
        keyboardType: TextInputType.text,
        onChanged: controller.updateEmail,
        decoration: InputDecoration(
          labelText: "Email",
          contentPadding: const EdgeInsets.all(20.0),
          prefixIcon: const Icon(Icons.email),
          border: _getInputBorder(),
          disabledBorder: _getInputBorder(),
          enabledBorder: _getInputBorder(),
          focusedBorder: _getInputBorder(),
          hintText: "example@domain.com",
          filled: true,
          fillColor: _getFillColor(),
        ),
      ),
    );
  }

  Widget _buildPhoneTextField() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: TextField(
        controller: null,
        keyboardType: TextInputType.number,
        maxLength: 10,
        onChanged: controller.updatePhone,
        decoration: InputDecoration(
          labelText: "Phone",
          contentPadding: const EdgeInsets.all(20.0),
          prefixIcon: const Icon(Icons.phone),
          border: _getInputBorder(),
          disabledBorder: _getInputBorder(),
          enabledBorder: _getInputBorder(),
          focusedBorder: _getInputBorder(),
          hintText: "Phone",
          filled: true,
          fillColor: _getFillColor(),
        ),
      ),
    );
  }

  Widget _buildRelationTextField() {
    List<String> relations = [
      "Amigo",
      "Amiga",
      "Primo",
      "Prima",
      "Hermano",
      "Hermana",
      "Suegro",
      "Suegra",
      "Tio",
      "Tia",
      "Mama",
      "Papa",
    ];

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField(
        onChanged: controller.updateRelation,
        items: relations.map((String e) => DropdownMenuItem(value: e.toLowerCase(), child: Text(e))).toList(),
        decoration: InputDecoration(
          labelText: "Relation",
          contentPadding: const EdgeInsets.all(20.0),
          prefixIcon: const Icon(Icons.accessibility),
          border: _getInputBorder(),
          disabledBorder: _getInputBorder(),
          enabledBorder: _getInputBorder(),
          focusedBorder: _getInputBorder(),
          hintText: "Relation",
          filled: true,
          fillColor: _getFillColor(),
        ),
      ),
    );
  }

  Widget _buildSubmit(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.10,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          onPressed: controller.submit,
          child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Invite Member", style: TextStyle(color: Colors.white)),
            Icon(Icons.keyboard_arrow_right, color: Colors.white),
            SizedBox(width: 10.0),
          ]),
        ),
      ),
    );
  }
}

class _MemberPhoto extends StatelessWidget {
  const _MemberPhoto();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InviteFamilyMemberController>(builder: (controller) {
      return CircleAvatar(
        radius: 62.0,
        backgroundColor: Colors.black,
        child: CircleAvatar(
          radius: 60.0,
          backgroundColor: Colors.white,
          child: Image.asset(controller.avatar, height: 70.0),
        ),
      );
    });
  }
}