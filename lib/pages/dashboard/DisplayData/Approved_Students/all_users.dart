// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/pages/dashboard/DisplayData/Approved_Students/widget/users_page.dart';
import 'package:library_management/pages/dashboard/DisplayData/overview/charts_screen/display_data_widget.dart';
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
        TextFormField(
          // onChanged: (search) {
          //   controller.getSearch(search);
          // },
          decoration: InputDecoration(
            hintText: "Search",
            contentPadding: EdgeInsets.all(12),
            hintStyle: TextStyle(
              fontSize: 13,
            ),
            border: InputBorder.none,
            fillColor: Colors.transparent,
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
