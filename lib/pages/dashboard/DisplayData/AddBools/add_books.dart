import 'package:flutter/material.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/widgets/CustomText/custom_text.dart';

class AddBooksPage extends StatelessWidget {
  const AddBooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CustomText(text: "Add Books", color: AppColor.black));
  }
}
