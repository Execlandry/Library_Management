import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/widgets/CustomText/custom_text.dart';

import '../../../../helpers/screen_helper/responsive.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menuController;
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomText(
                      text: menuController.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                      color: AppColor.black),
                ),
              ],
            ))
      ],
    );
  }
}
