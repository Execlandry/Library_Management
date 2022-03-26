import 'package:flutter/material.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/helpers/responsive.dart';
import 'package:library_management/widgets/ResponsiveScreens/large_screen.dart';
import 'package:library_management/widgets/ResponsiveScreens/medium_screen.dart';
import 'package:library_management/widgets/ResponsiveScreens/small_screen.dart';
import 'package:library_management/widgets/Header/top_nav.dart';

class DashLand extends StatefulWidget {
  const DashLand({Key? key}) : super(key: key);
  @override
  _DashLandState createState() => _DashLandState();
}

class _DashLandState extends State<DashLand> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bgSideMenu,
        drawer: Drawer(),
        appBar: topNavigationBar(context, scaffoldKey),
        // ignore: prefer_const_constructors
        body: SafeArea(
          child: ResponsiveWidget(
            largeScreen: LargeScreen(),
            smallScreen: SmallScreen(),
            mediumScreen: MediumScreen(),
          ),
        ));
  }
}
