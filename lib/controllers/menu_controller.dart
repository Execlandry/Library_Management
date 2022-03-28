import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/routes/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();

  //By default the active page will be Overview page
  var activeItem = OverViewPageRoute.obs;
  var hoverItem = "".obs;

  changeActiveitemTo(String itemName) {
    activeItem.value = itemName;
  }

  //Change the name of the item being hovered
  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;

  //returning a widget based on item name
  //calling the _customIcon method in this
  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case OverViewPageRoute:
        return _customIcon(Icons.trending_up, itemName);

      case DriversPageRoute:
        return _customIcon(Icons.drive_eta, itemName);

      case ClientsPageRoute:
        return _customIcon(Icons.people_alt_outlined, itemName);

      case AuthenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);

      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

//if active then add color property and make it bigger
  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName))
      // ignore: curly_braces_in_flow_control_structures
      return Icon(
        icon,
        size: 22,
        color: AppColor.dark,
      );
    //if the menu is just hovered then change to appropriate color
    return Icon(
      icon,
      color: isHovering(itemName) ? AppColor.dark : AppColor.lightGrey,
    );
  }
}
