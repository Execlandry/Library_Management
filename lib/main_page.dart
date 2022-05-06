import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/landing.dart';
import 'package:library_management/pages/dashboard/DisplayData/404/error.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/auth.dart';
import 'package:library_management/pages/introUi/welcome_page.dart';
import 'package:library_management/pages/userUi/home_page.dart';
import 'package:library_management/routes/routes.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return HomePage();
            Future.delayed(Duration.zero).then((value) => Get.toNamed(AppRoutes.homeRoute));
          } else {
            return WelcomePage();
             Future.delayed(Duration.zero).then((value) => Get.toNamed(AppRoutes.authenticationPageRoute));
          }
        },
      ),
    );
  }
}
