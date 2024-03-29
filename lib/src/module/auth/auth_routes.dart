import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:app/src/@core/resources/router/routes_config.dart';
import 'package:app/src/module/auth/auth_bindings.dart';

//screens
import 'package:app/src/module/auth/presentation/ui/auth_screen.dart';
import 'package:app/src/module/auth/presentation/ui/login_screen.dart';
import 'package:app/src/module/auth/presentation/ui/register_screen.dart';

List<GetPage<dynamic>> authRoutes = [
  GetPage(
    name: Routes.auth,
    page: () => const AuthScreen(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: Routes.login,
    page: () => const LoginScreen(),
    binding: LoginBindings(),
  ),
  GetPage(
    name: Routes.register,
    page: () => const RegisterScreen(),
    binding: RegisterBindings(),
  ),
];