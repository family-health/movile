import 'package:app/src/module/main/main_bindings.dart';
import 'package:app/src/module/main/presentation/ui/navigation_screen.dart';
import 'package:get/get.dart';
import 'package:app/src/@core/resources/router/routes_config.dart';

List<GetPage<dynamic>> mainRoutes = [
  GetPage(
    name: Routes.main,
    page: () => const MainScreen(),
    binding: MainBindings(),
  ),
];