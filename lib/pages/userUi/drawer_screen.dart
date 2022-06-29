import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/pages/userUi/config.dart';

import '../../controllers/FirebaseController/authController.dart';
import '../../routes/routes.dart';

class DrawerScreen extends StatefulWidget {
  String? email;
  DrawerScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreen,
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // CircleAvatar(),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Signed in as",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.email!,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  // Text('Active Status',
                  //     style: TextStyle(
                  //         color: Colors.white, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          // Column(
          //   children: drawerItems
          //       .map((element) => Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Row(
          //               children: [
          //                 Icon(
          //                   element['icon'],
          //                   color: Colors.white,
          //                   size: 30,
          //                 ),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 Text(element['title'],
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 20))
          //               ],
          //             ),
          //           ))
          //       .toList(),
          // ),
          Row(
            children: [
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),

              // SizedBox(
              //   width: 10,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Get.offAllNamed(AppRoutes.rootRoute);
              //   },
              //   child: Text(
              //     'Settings',
              //     style: TextStyle(
              //         color: Colors.white, fontWeight: FontWeight.bold),
              //   ),
              // ),

              GestureDetector(
                onTap: () {
                  AuthController.instance.logOut();
                },
                child: Row(children: [
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Log out',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ]),
              )
            ],
          )
        ],
      ),
    );
  }
}
