import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:library_management/common/app_colors.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(10),
      child: Row(children: [
        const Text(
          "Dashboard",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            navigationIcon(icon: Icons.search),
            navigationIcon(icon: Icons.send),
            navigationIcon(icon: Icons.notifications_none_rounded),
          ],
        )
      ]),
    );
  }
}

Widget navigationIcon({icon}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(icon, color: AppColor.black),
  );
}
