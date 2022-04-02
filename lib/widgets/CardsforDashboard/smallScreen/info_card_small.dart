import 'package:flutter/material.dart';
import 'package:library_management/widgets/CustomText/custom_text.dart';

import '../../../common/app_colors.dart';

class InfoCardSmall extends StatelessWidget {
  final String title;
  final String value;
  final bool isActive;
  //change to function if required
  final VoidCallback onTap;
  const InfoCardSmall(
      {Key? key,
      required this.title,
      required this.value,
      required this.isActive,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(24),
          // height: 136,
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isActive ? AppColor.active : AppColor.lightGrey,
                width: .5),
            // boxShadow: [
            //   BoxShadow(
            //     offset: Offset(0, 6),
            //     color: AppColor.lightGrey.withOpacity(.1),
            //     blurRadius: 12,
            //   ),
            // ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: title,
                  size: 24,
                  weight: FontWeight.w300,
                  color: isActive ? AppColor.active : AppColor.lightGrey),
              CustomText(
                  text: value,
                  size: 24,
                  weight: FontWeight.bold,
                  color: isActive ? AppColor.active : AppColor.lightGrey),
            ],
          ),
        ),
      ),
    );
  }
}
