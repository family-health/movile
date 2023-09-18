import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvatarsScreen extends StatelessWidget {
  const AvatarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(children: [
              const Text("What is your avatar?", style: TextStyle(color: Colors.white, fontSize: 18.0)),
              const SizedBox(height: 5.0),
              const Text("Please, select your avatar", style: TextStyle(color: Colors.grey, fontSize: 15.0)),
              const SizedBox(height: 15.0),
              Container(width: 80, height: 1, color: Colors.white),
            ]),
            const _AvatarList(),
          ],
        ));
  }
}

class _AvatarList extends StatelessWidget {
  const _AvatarList();

  @override
  Widget build(BuildContext context) {
    final List<String> avatars = [
      "assets/images/avatar/girl-1.png",
      "assets/images/avatar/girl-2.png",
      "assets/images/avatar/girl-3.png",
      "assets/images/avatar/girl-4.png",
      "assets/images/avatar/girl-5.png",
      "assets/images/avatar/male-1.png",
      "assets/images/avatar/male-2.png",
      "assets/images/avatar/male-3.png",
      "assets/images/avatar/male-4.png",
      "assets/images/avatar/male-5.png",
    ];

    return GridView.builder(
      shrinkWrap: true,
      itemCount: avatars.length,
      padding: const EdgeInsets.all(30.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 80,
        mainAxisSpacing: 15.0,
        
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Get.back<String?>(result: avatars[index]),
          child: buildAvatar(avatars[index]),
        );
      },
    );
  }

  Widget buildAvatar(String assetName) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade100,
      child: Image.asset(assetName, height: 50.0),
    );
  }
}
