import 'package:flutter/material.dart';
import 'package:library_management/helpers/navigation_helper/local_navigator.dart';
import 'package:library_management/pages/dashboard/DisplayData/overview/overview.dart';
import 'package:library_management/pages/dashboard/Entrypoint/sidebar_menu.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        //side Navigation Menu
        Expanded(child: SideBar()),
        //Main Body Part
        Expanded(
            //flex tells how much a container should be in width
            flex: 5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: localNavigator())),
      ],
    );
  }
}
