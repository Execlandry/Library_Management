import 'package:get/get.dart';
import 'package:library_management/landing.dart';
import 'package:library_management/pages/dashboard/DisplayData/404/error.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/auth.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/register.dart';
import 'package:library_management/pages/userUi/home_page.dart';


const RegisterPageDisplayName = "Register";

const OverViewPageDisplayName = "Overview";


const AddBooksDisplayName = "Add Books";

const StudentsPageDisplayName = "All Students";

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
  MenuItems(StudentsPageDisplayName, Routes.studentsPageRoute),
  MenuItems(AuthenticationPageDisplayName, Routes.authenticationPageRoute),
  MenuItems(RegisterPageDisplayName, Routes.registerRoute),
];

class AppRoutes {
  static const unknownRoute = Routes.unknownRoute;
  static const rootRoute = Routes.rootRoute;
  static const homeRoute = Routes.homeRoute;
  static const authenticationPageRoute = Routes.authenticationPageRoute;

  static const registerRoute = Routes.registerRoute;


  static final routes = [ 
        GetPage(name: unknownRoute, page: () => PageNotFound()),
        GetPage(name: rootRoute,page: () => Landing()),
        GetPage(name: homeRoute,page: () => HomePage()),

        GetPage(name: authenticationPageRoute, page: () => AuthPage()),
        GetPage(name: registerRoute, page: () => RegisterPage()),
  ];
}

class Routes {

  static const unknownRoute = "/not-found";
  static const rootRoute = "/dashboard";
  static const homeRoute = "/home";
  static const authenticationPageRoute = "/auth";
  static const overViewPageRoute = "/overview";
  static const addBooksRoute = "/books";
  static const studentsPageRoute = "/students";
  static const registerRoute = "/register";
}



