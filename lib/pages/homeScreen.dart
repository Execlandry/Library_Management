import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xoffset = 0;
  double yoffset = 0;
  double scalefactor = 1;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xoffset, yoffset, 0)
        ..scale(scalefactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0)),
      child: Column(
        children: [
          Row(
            children: [
              isDrawerOpen
                  ? IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        setState(() {
                          xoffset = 0;
                          yoffset = 0;
                          scalefactor = 1;
                          isDrawerOpen = false;
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        setState(() {
                          xoffset = 230;
                          yoffset = 150;
                          scalefactor = 0.6;
                          isDrawerOpen = true;
                        });
                      },
                    ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF00796B),
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.all(10.5),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 250,
                    ),
                    Text(
                      'Search For The Book',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
