import 'package:flutter/material.dart';
import 'package:library_management/pages/dashboard/DisplayData/AddBooks/add_books.dart';
import 'package:library_management/pages/dashboard/DisplayData/AllBooks/all_books.dart';
import 'package:library_management/pages/dashboard/DisplayData/Approved_Students/all_users.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/register.dart';
import 'package:library_management/routes/routes.dart';

import '../pages/dashboard/DisplayData/overview/overview.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.overViewPageRoute:
      return _getPageRoute(OverViewPage());

    case Routes.allBooksDisplayRoute:
      return _getPageRoute(AllBooks());

    case Routes.addBooksRoute:
      return _getPageRoute(AddBooksPage());
    case Routes.studentsPageRoute:
      return _getPageRoute(UsersDisplayPage());
    case Routes.registerRoute:
      return _getPageRoute(RegisterPage());
    default:
      return _getPageRoute(OverViewPage());
      // return _getPageRoute(RegisterPage());

  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
