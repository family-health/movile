import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Scaffold(
    //   body: controller.obx(
    //     (state) => const Text("State"),
    //     onEmpty: Container(),
    //     onLoading: const Center(child: CircularProgressIndicator()),
    //     onError: (error) => const Text("Error"),
    //   ),
    // );
  }
}
