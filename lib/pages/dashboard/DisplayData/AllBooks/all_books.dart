import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/controllers/FirebaseController/bookController.dart';
import 'package:library_management/pages/dashboard/DisplayData/AllBooks/books_page.dart';
import 'package:library_management/pages/userUi/book_page.dart';

import '../../../../common/app_colors.dart';
import '../../../../controllers/controller.dart';
import '../../../../helpers/screen_helper/responsive.dart';
import '../../../../widgets/CustomText/custom_text.dart';

class AllBooks extends GetView<BookController> {
  const AllBooks({Key? key}) : super(key: key);

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
          onChanged: (value) => controller.filterBooks(value),
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
          child: BooksPage(),
        ),
        // Expanded(child: DisplayDataWidget())
      ],
    );
  }
}
