import 'package:flutter/material.dart';
import 'package:library_management/pages/dashboard/DisplayData/AddBools/add_books.dart';
import 'package:library_management/pages/dashboard/DisplayData/Approved_Students/all_approved_student.dart';
import 'package:library_management/routes/routes.dart';

import '../pages/dashboard/DisplayData/overview/overview.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverViewPageRoute:
      return _getPageRoute(OverViewPage());
    case AddBooksRoute:
      return _getPageRoute(AddBooksPage());
    case StudentsPageRoute:
      return _getPageRoute(AllApprovedStudentsPage());
    default:
      return _getPageRoute(OverViewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
