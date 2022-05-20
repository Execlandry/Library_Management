import 'package:flutter/material.dart';
import 'package:library_management/pages/HomeScreen.dart';
import 'package:library_management/pages/drawerPage.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(fontFamily: 'Circular'),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [DrawerScreen(), HomeScreen()],
      ),
    );
  }
}
