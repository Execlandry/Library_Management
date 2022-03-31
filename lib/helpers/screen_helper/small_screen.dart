import 'package:flutter/material.dart';
import 'package:library_management/helpers/navigation_helper/local_navigator.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return localNavigator();
  }
}
