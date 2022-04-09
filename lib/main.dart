// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/controllers/LocalNavigation/navigation_controller.dart';
import 'package:library_management/controllers/menu_controller.dart';
import 'package:library_management/landing.dart';
import 'package:library_management/pages/dashboard/DisplayData/404/error.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/auth.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/register.dart';
import 'package:library_management/routes/routes.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AuthenticationPageRoute,
      unknownRoute: GetPage(
          name: '/not-found',
          page: () => PageNotFound(),
          transition: Transition.fadeIn),
      getPages: [
        GetPage(
            name: RootRoute,
            page: () {
              return Landing();
            }),
        GetPage(name: AuthenticationPageRoute, page: () => AuthPage()),
        GetPage(name: RegisterRoute, page: () => RegisterPage()),
      ],

      title: 'Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColor.light,
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
          primaryColor: Colors.blue),
      // initialRoute: AppRoutes.dashboard,
      // getPages: AppRoutes.routes,
      // home: AnimatedSplashScreen(
      //     splash: Icons.home,
      //     duration: 3000,
      //     splashTransition: SplashTransition.scaleTransition,
      //     backgroundColor: Color.fromARGB(255, 126, 191, 245),
      //     nextScreen: Landing()),
    );
  }
}
