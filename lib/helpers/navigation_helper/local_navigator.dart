import 'package:flutter/cupertino.dart';
import 'package:library_management/routes/router.dart';

import '../../controllers/controller.dart';
import '../../routes/routes.dart';

Navigator localNavigator() => Navigator(
  key: navigationController.navigationKey,
  initialRoute: Routes.overViewPageRoute,
  onGenerateRoute: generateRoute,
);