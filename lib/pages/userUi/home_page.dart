// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/controllers/FirebaseController/authController.dart';

import '../../common/app_colors.dart';
import '../../routes/routes.dart';
import '../../widgets/CustomText/custom_text.dart';

class HomePage extends StatelessWidget {
  String? email;
  HomePage({Key? key, required this.email}) : super(key: key);

  @override
  // State<HomePage> createState() => _HomePageState();

// class _HomePageState extends State<HomePage> {
  // final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA7FFEB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          color: Color(0xFF37474F),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF00796B),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 25,
              ),

              //Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF00796B),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              Spacer(),
              Container(
                child: Column(
                  children: [
                    Text(email!),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        AuthController.instance.logOut();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.active,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: CustomText(
                          text: "Log Out",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Get.offAllNamed(AppRoutes.rootRoute);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.active,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: CustomText(
                          text: "AuthPage",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SliderPageBody(),
            ],
          ),
        ),
      ),
    );
  }
}
