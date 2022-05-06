import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/pages/dashboard/DisplayData/AddBooks/widgets/table_addbook.dart';
import 'package:library_management/widgets/CustomText/custom_text.dart';

import '../../../../controllers/controller.dart';
import '../../../../helpers/screen_helper/responsive.dart';

class AddBooksPage extends StatelessWidget {
  const AddBooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
          Expanded(
            child: ListView(
              children: [
                AddBooksTable()],
            ),
          ),
        ],
      ),
    );
  }
}
