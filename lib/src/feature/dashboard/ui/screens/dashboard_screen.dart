import 'package:app/src/feature/dashboard/ui/notifiers/dashboard_controller.dart';
import 'package:app/src/feature/dashboard/ui/widgets/people_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final DashboardController _con = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            await _con.getAllFamilies();
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              _header(),
              const SizedBox(height: 20.0),
              _statics(),
              const SizedBox(height: 20.0),
              // _families()
              _lista(context)
            ]),
          ),
        ),
      ),
    );
  }

  Widget _lista(BuildContext context) {
    return Obx(() {
      if (_con.families.isEmpty) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Familiares",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                Text("Ver todos", style: TextStyle(color: Colors.black45)),
              ],
            ),
            const SizedBox(height: 40),
            const Center(child: Text('Sin datos')),
          ],
        );
      } else {
        final firstTwoFamilies = _con.getFirstTwoFamilies();
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Familiares",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                  Text("Ver todos", style: TextStyle(color: Colors.black45)),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: firstTwoFamilies.length,
                itemBuilder: (context, index) {
                  final family = firstTwoFamilies[index];
                  return PeopleCard(
                    name: family.name ?? '',
                    email: family.email ?? '',
                    image: "assets/images/avatar/user_profile.png",
                  );
                },
              ),
            ],
          ),
        );
      }
    });
  }

  Widget _families() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Familiares",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
          Text("Ver todos", style: TextStyle(color: Colors.black45)),
        ],
      ),
      const SizedBox(height: 15.0),
      Column(
        children: const [
          PeopleCard(
              name: "Joseph Garcia",
              email: "josephdgb1996@gmail.com",
              image: "assets/images/avatar/user_profile.png"),
          PeopleCard(
              name: "Joseph Garcia",
              email: "josephdgb1996@gmail.com",
              image: "assets/images/avatar/user_profile.png"),
          PeopleCard(
              name: "Joseph Garcia",
              email: "josephdgb1996@gmail.com",
              image: "assets/images/avatar/user_profile.png"),
        ],
      ),
    ]);
  }

  Widget _header() {
    TextStyle textStyle = const TextStyle(
        color: Colors.blue, fontSize: 25.0, fontWeight: FontWeight.w600);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Hola", style: textStyle),
          Text("${_con.user.name}", style: textStyle),
        ]),
        const Icon(Icons.search, size: 35.0, color: Colors.blue),
      ],
    );
  }

  Widget _statics() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Estadisticas mensuales",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
        const SizedBox(height: 15.0),
        Container(
          padding: const EdgeInsets.all(15.0),
          height: 130.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("80%",
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                    Text("Tratamientos exitosos",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                const Text("5% mejor que el anterior mes",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white38,
                        fontWeight: FontWeight.w400)),
              ]),
        ),
      ],
    );
  }
}
