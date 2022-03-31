import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  //TWO METHODS THAT WILL ALLOW US TO CHANGE SCREENS AND
  //OTHER ONE TO GO BACK

  Future<dynamic> navigateTo(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName);
  }

  goBack() => navigationKey.currentState!.pop();
}
