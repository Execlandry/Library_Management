import 'package:flutter/material.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/helpers/responsive.dart';

import 'package:library_management/helpers/large_screen.dart';
import 'package:library_management/helpers/small_screen.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColor.light,
        drawer: Drawer(
          child: SideBar(),
        ),
        appBar: topNavigationBar(context, scaffoldKey),
        // ignore: prefer_const_constructors
        body: SafeArea(
          child: const ResponsiveWidget(
            largeScreen: LargeScreen(),
            smallScreen: SmallScreen(),
            mediumScreen: LargeScreen(),
          ),
        ));
  }
}
