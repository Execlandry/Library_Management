// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management/common/firebase.dart';
import 'package:library_management/controllers/FirebaseController/authController.dart';
import 'package:library_management/controllers/FirebaseController/bookController.dart';
import 'package:library_management/controllers/LocalNavigation/navigation_controller.dart';
import 'package:library_management/controllers/menu_controller.dart';
import 'package:library_management/dash_landing.dart';
import 'package:library_management/firebase_options.dart';
import 'package:library_management/home_landing.dart';
import 'package:library_management/pages/dashboard/DisplayData/404/error.dart';
import 'package:library_management/pages/introUi/welcome_page.dart';
import 'package:library_management/routes/routes.dart';

import 'common/app_colors.dart';
import 'controllers/FirebaseController/usersController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    //This are business logic instances that needs to be loaded into memory
    //this are loaded permanently in memory until the app is killed
    Get.put(AuthController());
    Get.put(MenuController());
    Get.put(NavigationController());
    Get.put(BookController());
    Get.put(UsersController());
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: AppRoutes.welcomeRoute,
      home: MainPage(),
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
        primaryColor: AppColor.kprimaryColor,
      ),
      unknownRoute: GetPage(
          name: AppRoutes.unknownRoute,
          page: () => PageNotFound(),
          transition: Transition.fadeIn),
      getPages: AppRoutes.routes,
    );
  }
}

class MainPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(snapshot.data!.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final userDoc = snapshot.data;

                  // final user = userDoc!.data();
                  final user = userDoc!;

                  if (user['role'] == 'user') {
                  
                    return HomeLanding();
                
                  } else {
                    return DashLanding();
                  }
                } else {
                  return Material(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          }
          return WelcomePage();
        });
  }
}
