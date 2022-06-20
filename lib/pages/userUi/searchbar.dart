import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:library_management/controllers/FirebaseController/bookController.dart';

import '../../common/app_colors.dart';

class SearchBar extends GetView<BookController> {

  SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(children: [
          Container(
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: AppColor.kprimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    // color: AppColor.kprimaryColor.withOpacity(0.23),
                    offset: Offset(0, 10),
                    blurRadius: 50,
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) => controller.filterBooks(value),
                decoration: InputDecoration(
                  hintText: "Search a Book",
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
