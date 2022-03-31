import 'package:flutter/material.dart';
import 'package:library_management/helpers/screen_helper/responsive.dart';

import 'horizontal_sidemenu_items.dart';
import 'vertical_sidemenu_items.dart';


class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const SideMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomSize(context))
      return VerticalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );

    return HorizontalMenuItem(
      itemName: itemName,
      onTap: onTap,
    );
  }
}
