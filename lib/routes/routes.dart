import 'package:get/get.dart';
import 'package:library_management/dash_landing.dart';
import 'package:library_management/pages/dashboard/DisplayData/404/error.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/admin_reg.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/auth.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/register.dart';
import 'package:library_management/pages/introUi/welcome_page.dart';
import 'package:library_management/home_landing.dart';
import 'package:library_management/controllers/FirebaseController/authController.dart';

const RegisterPageDisplayName = "Register";

const OverViewPageDisplayName = "Overview";

const AddBooksDisplayName = "Add Books";

const UsersPageDisplayName = "Users";

const AuthenticationPageDisplayName = "Log Out";
// const AuthenticationPageRoute = "/auth";

class MenuItems {
  final String name;
  final String route;

  MenuItems(this.name, this.route);
}

List<MenuItems> sideMenuItemRoute = [
  MenuItems(OverViewPageDisplayName, Routes.overViewPageRoute),
  MenuItems(AddBooksDisplayName, Routes.addBooksRoute),
  MenuItems(UsersPageDisplayName, Routes.studentsPageRoute),
  // MenuItems(AuthenticationPageDisplayName, Routes.authenticationPageRoute),
  MenuItems(RegisterPageDisplayName, Routes.registerRoute),
];

class AppRoutes {
  static const unknownRoute = Routes.unknownRoute;
  static const rootRoute = Routes.rootRoute;
  static const welcomeRoute = Routes.welcomeRoute;
  static const homeRoute = Routes.homeRoute;
  static const authenticationPageRoute = Routes.authenticationPageRoute;
  static const registerRoute = Routes.registerRoute;

  static final routes = [
    GetPage(name: unknownRoute, page: () => PageNotFound()),
    GetPage(name: rootRoute, page: () => DashLanding()),
    GetPage(name: welcomeRoute, page: () => WelcomePage()),
    GetPage(
        name: homeRoute,
        page: () => HomeLanding(
            // email: AuthController.instance.auth.currentUser!.email,
            // name: AuthController.instance.auth.currentUser!.name,
            )),
    GetPage(name: authenticationPageRoute, page: () => AuthPage()),
    GetPage(name: registerRoute, page: () => AdminRegisterPage()),
  ];
}

class Routes {
  static const unknownRoute = "/not-found";
  static const welcomeRoute = "/welcome";
  static const homeRoute = "/home";
  static const rootRoute = "/dashboard";
  static const authenticationPageRoute = "/auth";
  static const overViewPageRoute = "/overview";
  static const addBooksRoute = "/books";
  static const studentsPageRoute = "/students";
  static const registerRoute = "/register";
}
