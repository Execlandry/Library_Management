import 'package:get/get.dart';
import 'package:library_management/pages/dashboard/Entrypoint/dashland.dart';

class AppRoutes {
  static const dashboard = Routes.dashboard;
// static const register = Routes.register;
// static const login = Routes.login;

  static final routes = [
    GetPage(name: Routes.dashboard, page: () => const DashLand()),
    // GetPage(name: Routes.register, page: () =>  RegisterView()),
    // GetPage(name: Routes.login, page: () =>  LoginView()),
  ];
}

class Routes {
  static const dashboard = '/dashboard';
  // static const register = '/register';
  // static const login = '/login';
}
