import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/pages/dashboard/dashboard.dart';

import 'SideBar_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgSideMenu,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //side Navigation Menu
              Expanded(child: SideBar()),
              //Main Body Part
              Expanded(
                  //flex tells how much a container should be in width
                  flex: 5,
                  child: Dashboard()),
            ],
          ),
        ));
  }
}
