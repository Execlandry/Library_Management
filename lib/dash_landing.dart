import 'package:flutter/material.dart';
import 'package:library_management/helpers/navigation_helper/local_navigator.dart';
import 'package:library_management/helpers/screen_helper/responsive.dart';
import 'package:library_management/pages/dashboard/Entrypoint/sidebar_menu.dart';
import 'package:library_management/helpers/screen_helper/large_screen.dart';
import 'package:library_management/pages/dashboard/Header/top_nav.dart';

class DashLanding extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: topNavigationBar(context, scaffoldKey),
        drawer: Drawer(
          child: SideBar(),
        ),
        // ignore: prefer_const_constructors
        body: SafeArea(
          child: ResponsiveWidget(
              largeScreen: LargeScreen(),
              smallScreen: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: localNavigator(),
              )),
        ));
  }
}
