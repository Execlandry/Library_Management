import 'package:get/get.dart';
import 'package:library_management/landing.dart';
import 'package:library_management/pages/IconSplash/Splash.dart';
import 'package:library_management/pages/dashboard/DisplayData/404/error.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/auth.dart';

const RootRoute = "/";

const RegisterPageDisplayName = "Register";
const RegisterRoute = "/register";

const OverViewPageDisplayName = "Overview";
const OverViewPageRoute = "/overview";

const AddBooksDisplayName = "Add Books";
const AddBooksRoute = "/addBooks";

const StudentsPageDisplayName = "All Students";
const StudentsPageRoute = "/allStudents";

const AuthenticationPageDisplayName = "Log Out";
const AuthenticationPageRoute = "/auth";

class MenuItems {
  final String name;
  final String route;

  MenuItems(this.name, this.route);
}

List<MenuItems> sideMenuItems = [
  MenuItems(OverViewPageDisplayName, OverViewPageRoute),
  MenuItems(AddBooksDisplayName, AddBooksRoute),
  MenuItems(StudentsPageDisplayName, StudentsPageRoute),
  MenuItems(AuthenticationPageDisplayName, AuthenticationPageRoute),
  MenuItems(RegisterPageDisplayName, RegisterRoute),
];

// class AppRoutes {
//   static const dashboard = Routes.RootRoute;
//   static const splash = Routes.AuthenticationPageRoute;
//   static const NotFound = Routes.NotFound;


//   static final routes = [
//     GetPage(name: RootRoute, page: () => Landing()),
//     GetPage(name: AuthenticationPageRoute, page: () => AuthPage()),
//     GetPage(name: NotFound, page: () => PageNotFound()),
//   ];
// }

// class Routes {
//   static const RootRoute = "/";
//   static const AuthenticationPageRoute = "/auth";
//   static const NotFound = "/not-found";
// }
