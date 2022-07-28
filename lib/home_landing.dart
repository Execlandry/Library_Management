// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/controllers/FirebaseController/authController.dart';
import 'package:library_management/pages/userUi/drawer_screen.dart';
import 'package:library_management/pages/userUi/home_page.dart';



class HomeLanding extends StatelessWidget {
  // String? email;
  HomeLanding({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA7FFEB),
      body: SafeArea(
        child: Stack(
          children: [
            DrawerScreen(email:AuthController.instance.auth.currentUser!.email),
            HomePage(),
          ],
        ),
      ),
    );
  }
}
