import 'package:get/get.dart';
import 'package:app/src/shared/routes/routes.dart';
import 'package:app/src/module/home/home_screen.dart';

export 'package:app/src/module/home/home_screen.dart';

List<GetPage<dynamic>> homeRoutes = [
  GetPage(name: Routes.home, page: () => const HomeScreen()),
];
