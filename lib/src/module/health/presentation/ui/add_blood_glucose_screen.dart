import 'package:app/src/module/health/presentation/logic/add_blood_glucose_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBloodGlucoseScreen extends GetView<AddBloodGlucoseController>{
  const AddBloodGlucoseScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(AddBloodGlucoseController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
          TextButton(onPressed: controller.saveBloodGlucose, child: const Text("Save", style: TextStyle(color: Colors.white))),
        ]),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ImageIcon(AssetImage("assets/icons/png/filled/body/blood_drop.png"), size: 80.0),
                const SizedBox(height: 10.0),
                const Text("Add Blood Glucose", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800)),
                const SizedBox(height: 15.0),
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: false),
                  onChanged: controller.onChange,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    prefixIcon: Icon(Icons.bloodtype),
                    suffixText: "mg/dl",
                    suffixStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2)
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2)
                    ),
                    hintText: "example: 70",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// "F:\Organizations\Family Health\Repositories\app\assets\icons\png\negative\body\blood_drop.png"