import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:library_management/common/app_colors.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color topColor;
  final bool isActive;
  //change to function if required
  final VoidCallback onTap;
  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
    required this.topColor,
    this.isActive = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 136,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 6),
                color: AppColor.lightGrey.withOpacity(.1),
                blurRadius: 12,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      //change it topColor ?? isActive
                      color: AppColor.active,
                      height: 5,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$title\n",
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              isActive ? AppColor.active : AppColor.lightGrey,
                        ),
                      ),
                      TextSpan(
                        text: "$value\n",
                        style: TextStyle(
                          fontSize: 40,
                          color:
                              isActive ? AppColor.active : AppColor.lightGrey,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
