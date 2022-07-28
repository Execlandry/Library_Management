import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class LiquidRefresh extends StatefulWidget {
  const LiquidRefresh({Key? key}) : super(key: key);

  @override
  _LiquidRefresh createState() => _LiquidRefresh();
}

class _LiquidRefresh extends State<LiquidRefresh> {
  Future<void> _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 31, 138, 123),
        body: LiquidPullToRefresh(
          color: Color.fromARGB(255, 7, 116, 110),
          height: 300,
          backgroundColor: Color.fromARGB(255, 31, 138, 123),
          onRefresh: _handleRefresh,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 300,
                      color: Color.fromARGB(255, 7, 116, 110),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
