import 'package:get/get.dart';
import 'package:library_management/dash_landing.dart';
import 'package:library_management/pages/dashboard/DisplayData/404/error.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/admin_reg.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/auth.dart';
import 'package:library_management/pages/introUi/welcome_page.dart';
import 'package:library_management/home_landing.dart';

const registerPageDisplayName = "Register";

const overViewPageDisplayName = "Overview";

const allBooksDisplayName = "All Books";
const addBooksDisplayName = "Add Books";

const usersPageDisplayName = "Users";

const authenticationPageDisplayName = "Log Out";
// const AuthenticationPageRoute = "/auth";

class MenuItems {
  final String name;
  final String route;

  MenuItems(this.name, this.route);
}

List<MenuItems> sideMenuItemRoute = [
  // MenuItems(overViewPageDisplayName, Routes.overViewPageRoute),
  MenuItems(allBooksDisplayName, Routes.allBooksDisplayRoute),
  MenuItems(addBooksDisplayName, Routes.addBooksRoute),
  MenuItems(usersPageDisplayName, Routes.studentsPageRoute),
  // MenuItems(AuthenticationPageDisplayName, Routes.authenticationPageRoute),
  // MenuItems(registerPageDisplayName, Routes.registerRoute),
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
  static const allBooksDisplayRoute = "/all-books";
  static const addBooksRoute = "/add-books";
  static const studentsPageRoute = "/students";
  static const registerRoute = "/register";
}
