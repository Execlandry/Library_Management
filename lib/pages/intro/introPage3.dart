import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {

  @override 
  Widget build(BuildContext context){
    return Container(
      color: Color.fromARGB(255, 10, 134, 118),
      child: Center(
        child:Lottie.asset(
          'animations/connection-people.json',
          height:300,
          ),
       ),
    );
  }
}