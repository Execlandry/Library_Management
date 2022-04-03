import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/pages/dashboard/DisplayData/overview/Overview_Screens/overview_cards_large.dart';
import 'package:library_management/pages/dashboard/DisplayData/overview/Overview_Screens/overview_cards_medium.dart';
import 'package:library_management/pages/dashboard/DisplayData/overview/Overview_Screens/overview_cards_small.dart';
import 'package:library_management/widgets/CustomText/custom_text.dart';

import '../../../../controllers/controller.dart';
import '../../../../helpers/screen_helper/responsive.dart';

class OverViewPage extends StatefulWidget {
  const OverViewPage({Key? key}) : super(key: key);

  @override
  _OverViewPage createState() => _OverViewPage();
}

class _OverViewPage extends State<OverViewPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                child: CustomText(
                    text: menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                    color: AppColor.black),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  OverViewCardsMediumScreen()
                else
                  OverviewCardsLargeScreen()
              else
                OverViewCardsSmallScreen()
            ],
          ),
        ),
      ],
    );
  }
}
