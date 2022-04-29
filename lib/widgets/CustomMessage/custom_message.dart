import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/widgets/CustomText/custom_text.dart';

void showCustomSnackBar(String message,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    message,
    titleText: CustomText(text: title, color: AppColor.black),
    messageText: Text(
      message,
      style: TextStyle(color: AppColor.black),
    ),
    colorText: AppColor.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.redAccent,
  );
}
