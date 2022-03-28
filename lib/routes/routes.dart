import 'package:get/get.dart';
import 'package:library_management/landing.dart';

const OverViewPageRoute = "Overview";
const DriversPageRoute = "Drivers";
const ClientsPageRoute = "Clients";
const AuthenticationPageRoute = "Authentication";

List sideMenuItems = [
  OverViewPageRoute,
  DriversPageRoute,
  ClientsPageRoute,
  AuthenticationPageRoute,
];

class AppRoutes {
  static const dashboard = Routes.dashboard;
// static const register = Routes.register;
// static const login = Routes.login;

  static final routes = [
    GetPage(name: Routes.dashboard, page: () => const Landing()),
    // GetPage(name: Routes.register, page: () =>  RegisterView()),
    // GetPage(name: Routes.login, page: () =>  LoginView()),
  ];
}

class Routes {
  static const dashboard = '/dashboard';
  // static const register = '/register';
  // static const login = '/login';
}
