import 'package:flutter/material.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/pages/dashboard/Entrypoint/dashboard.dart';

import 'sidebar_menu.dart';

class DashLand extends StatefulWidget {
  const DashLand({Key? key}) : super(key: key);
  @override
  _DashLandState createState() => _DashLandState();
}

class _DashLandState extends State<DashLand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgSideMenu,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //side Navigation Menu
              const Expanded(child: SideBar()),
              //Main Body Part
              const Expanded(
                  //flex tells how much a container should be in width
                  flex: 5,
                  child: Dashboard()),
            ],
          ),
        ));
  }
}
