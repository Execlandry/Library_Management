import 'package:flutter/widgets.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/pages/dashboard/DisplayData/display_data_widget.dart';
import 'package:library_management/pages/dashboard/Notificationwidget/notification_card.dart';

// import '../Header/header_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColor.bgColor, borderRadius: BorderRadius.circular(30)),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          //Header part
          // const HeaderWidget(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const NotificationCardWidget(),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 20,
                      ),
                      const DisplayDataWidget(),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      // color: AppColor.yellow,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
