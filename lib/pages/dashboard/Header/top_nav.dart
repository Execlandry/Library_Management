import 'package:flutter/material.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/helpers/screen_helper/responsive.dart';
import 'package:library_management/widgets/CustomText/custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: Image.asset(
                    "assets/user1.png",
                    width: 28,
                  ),
                ),
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                key.currentState?.openDrawer();
              },
            ),
      elevation: 0,
      title: Container(
        child: Row(children: [
          Visibility(
              visible: !ResponsiveWidget.isSmallScreen(context),
              child: CustomText(
                text: "Dashboard",
                color: AppColor.lightGrey,
                size: 18,
                weight: FontWeight.bold,
              )),
          Expanded(
            child: Container(),
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: AppColor.dark.withOpacity(.7),
            ),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: AppColor.dark.withOpacity(.7),
                ),
                onPressed: () {},
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColor.light, width: 2),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 1,
            height: 22,
            color: AppColor.lightGrey,
          ),
          SizedBox(
            width: 24,
          ),
          CustomText(
            text: "Execlandry",
            color: AppColor.lightGrey,
            weight: FontWeight.bold,
            size: 16,
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: AppColor.light,
                child: Icon(Icons.person_outline, color: AppColor.dark),
              ),
            ),
          ),
        ]),
      ),
      iconTheme: IconThemeData(
        color: AppColor.dark,
      ),
      backgroundColor: Colors.transparent,
    );