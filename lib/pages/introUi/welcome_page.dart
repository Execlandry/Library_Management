import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:library_management/widgets/IntroPages/IntroAnimation/anime.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../routes/routes.dart';
import '../../widgets/IntroPages/intropage1.dart';
import '../../widgets/IntroPages/intropage2.dart';
import '../../widgets/IntroPages/intropage3.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
            alignment: Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text('skip'),
                ),

                //dotted indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: JumpingDotEffect(
                    activeDotColor: Color.fromARGB(255, 3, 71, 62),
                    dotColor: Color.fromARGB(255, 229, 235, 234),
                    spacing: 24,
                  ),
                ),

                //next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Get.offAllNamed(AppRoutes.homeRoute);
                        },
                        child: Text('done'),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('next'),
                      ),
              ],
            ))
      ],
    ));
  }
}
