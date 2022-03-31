import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/controllers/controller.dart';
import 'package:library_management/helpers/screen_helper/responsive.dart';
import 'package:library_management/routes/routes.dart';
import 'package:library_management/widgets/CustomText/custom_text.dart';

import 'SideMenuItems/side_menu_item.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: AppColor.light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Image.asset("assets/user1.png"),
                    ),
                    Flexible(
                        child: CustomText(
                      text: "Dashboard",
                      size: 20,
                      weight: FontWeight.bold,
                      color: AppColor.active,
                    )),
                    SizedBox(
                      width: _width / 48,
                    )
                  ],
                ),
              ],
            ),
          Divider(
            color: AppColor.lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((itemName) => SideMenuItem(
                      itemName: itemName == AuthenticationPageRoute
                          ? "Log Out"
                          : itemName,
                      onTap: () {
                        if (itemName == AuthenticationPageRoute) {
                          // TODO:: go to authentication page
                        }

                        if (!menuController.isActive(itemName)) {
                          menuController.changeActiveitemTo(itemName);
                          if (ResponsiveWidget.isSmallScreen(context))
                            Get.back();
                          navigationController.navigateTo(itemName);
                        }
                      },
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
