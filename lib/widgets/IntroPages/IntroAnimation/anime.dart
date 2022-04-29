import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimePage extends StatefulWidget{
  const AnimePage ({Key? key}) : super(key: key);

  @override 
  _AnimePageState createState() =>_AnimePageState(); 
}

class _AnimePageState extends State<AnimePage> with SingleTickerProviderStateMixin{
   //controller
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
      );

  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  bool  bookmarked = false;


  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (bookmarked==false){
              bookmarked=true;
              _controller.forward();
            }
            else{
              bookmarked=false;
              _controller.reverse();
            }
          },
          child: Lottie.network(
             'https://assets9.lottiefiles.com/packages/lf20_fz6xe55o.json',
              controller: _controller,
        ),     
       ),
      )
    );
  }
}