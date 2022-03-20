import 'package:flutter/material.dart';
import 'package:library_management/common/app_colors.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: AppColor.bgSideMenu,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: AppColor.white,
              //gave margin on horizontal and vertical
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "ADMIN PANEL",
                style: TextStyle(
                    color: AppColor.yellow,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            DrawerListTile(
              title: "Dashboard",
              // icon: "assets/menu_home.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Calender",
              // icon: "assets/menu_home.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Reports",
              // icon: "assets/menu_home.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Settings",
              // icon: "assets/menu_home.png",
              press: () {},
            ),
            const Spacer(),
            // Image.asset("assets/sidebar_image")
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title /*icon*/;
  final VoidCallback press;

  const DrawerListTile(
      {Key? key,
      required this.title,
      /*required this.icon,*/ required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      // leading: Image.asset(icon,color:AppColor.white,height:16,),
      title: Text(
        title,
        style: TextStyle(color: AppColor.white),
      ),
    );
  }
}
