import 'package:flutter/material.dart';
import 'package:library_management/helpers/screen_helper/responsive.dart';
import 'package:library_management/pages/dashboard/Entrypoint/sidebar_menu.dart';
import 'package:library_management/helpers/screen_helper/large_screen.dart';
import 'package:library_management/helpers/screen_helper/small_screen.dart';
import 'package:library_management/pages/dashboard/Header/top_nav.dart';

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
        extendBodyBehindAppBar: true,
        drawer: Drawer(
          child: SideBar(),
        ),
        appBar: topNavigationBar(context, scaffoldKey),
        // ignore: prefer_const_constructors
        body: SafeArea(
          child: ResponsiveWidget(
            largeScreen: LargeScreen(),
            smallScreen: SmallScreen(),
            mediumScreen: LargeScreen(),
          ),
        ));
  }
}
