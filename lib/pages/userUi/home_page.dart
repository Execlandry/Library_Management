import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/pages/userUi/book_card.dart';
import 'package:library_management/pages/userUi/book_page.dart';
import 'package:library_management/pages/userUi/searchbar.dart';
// import 'package:pet_ui/configuration.dart';
// import 'package:pet_ui/screen2.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  // TextEditingController _searchController = TextEditingController();
  // List _allResult = [];

  //  String? email;
  // String? name;

  // getBooksStream() async {
  //   final uid = await FirebaseAuth.instance.currentUser;
  //   // var data = await FirebaseFirestore.instance
  //   // .collection("books").doc(uid).get();

  //   setState(() {
  //     // _allResult = data.document;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen
                    ? IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            xOffset = 230;
                            yOffset = 150;
                            scaleFactor = 0.6;
                            isDrawerOpen = true;
                          });
                        }),
                Column(
                  children: [
                    Text(
                      'Welcome !',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Row(
                    // children: [
                    // Icon(
                    // Icons.location_on,
                    // color: primaryGreen,
                    // ),
                    // if(user != null ){
                    //   Text(),
                    // }
                    // else{

                    // }
                    // ],
                    // ),
                  ],
                ),
                SizedBox(
                  width: 40,
                )
                // CircleAvatar()
              ],
            ),
          ),
          // SizedBox(height: 50),

         SearchBar(),
          SizedBox(
            height: 20,
          ),
          Expanded(child: BookPage()),
        ],
      ),
    );
  }
}
