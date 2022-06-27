// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/pages/dashboard/DisplayData/Approved_Students/widget/users_page.dart';
import 'package:library_management/widgets/CustomText/custom_text.dart';

import '../../../../controllers/FirebaseController/usersController.dart';
import '../../../../controllers/controller.dart';
import '../../../../helpers/screen_helper/responsive.dart';

class UsersDisplayPage extends GetView<UsersController> {
  const UsersDisplayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 6 : 6),
                child: CustomText(
                    text: menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                    color: AppColor.black),
              ),
            ],
          ),
        ),
        TextField(
          onChanged: (value) => controller.filterUsers(value),
          decoration: InputDecoration(
            hintText: "Search a User",
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
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: UsersPage(),
        ),
        // Expanded(child: DisplayDataWidget())
      ],
    );
  }
}
