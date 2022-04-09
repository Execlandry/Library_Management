import 'package:flutter/material.dart';
import 'package:library_management/pages/dashboard/DisplayData/AddBooks/add_books.dart';
import 'package:library_management/pages/dashboard/DisplayData/Approved_Students/all_approved_student.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/register.dart';
import 'package:library_management/routes/routes.dart';

import '../pages/dashboard/DisplayData/overview/overview.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverViewPageDisplayName:
      return _getPageRoute(OverViewPage());
    case AddBooksDisplayName:
      return _getPageRoute(AddBooksPage());
    case StudentsPageDisplayName:
      return _getPageRoute(AllApprovedStudentsPage());
    case RegisterPageDisplayName:
      return _getPageRoute(RegisterPage());
    default:
      return _getPageRoute(OverViewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
