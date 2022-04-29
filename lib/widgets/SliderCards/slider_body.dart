import 'package:flutter/material.dart';
import 'package:library_management/common/app_colors.dart';

class SliderPageBody extends StatefulWidget {
  const SliderPageBody({Key? key}) : super(key: key);

  @override
  State<SliderPageBody> createState() => _SliderPageBodyState();
}

class _SliderPageBodyState extends State<SliderPageBody> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          padding: EdgeInsets.all(16),
          itemExtent: 250,
          children: [
            // buildCard(0),
            Card(
              color: AppColor.lightGrey,
              child: Text("hello"),)
          ],
        ));
}