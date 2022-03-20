import 'package:flutter/material.dart';
import 'package:library_management/common/app_colors.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //turn it yellow
          color: AppColor.yellow,
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 16, color: AppColor.black),
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const TextSpan(text: "Good Morning!"),
                    const TextSpan(
                        text: "Execlandry",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              Text(
                "Today you have 9 new notification\nwassup\ndo you get it",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.black,
                  height: 1.5,
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              Text(
                "Read More",
                style: TextStyle(
                    fontSize: 14,
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          const Spacer(),
          // Image.asset(
          //   "assets/notification_image.png",
          //   height: 160,
          // ),
          
        ],
      ),
    );
  }
}
