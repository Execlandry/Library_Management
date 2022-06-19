import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String accession;
  final String title;
  final String callno;
  final String pages;
  final String year;
  final String edition;
  final String stocked;
  final color;

  const BookCard({
    Key? key,
    required this.accession,
    required this.title,
    required this.callno,
    required this.pages,
    required this.year,
    required this.edition,
    required this.stocked,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      // backgroundColor: Color.fromARGB(255, 140, 245, 201),
      child: Column(children: [
        Center(
          child: Container(
            width: 350,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF0C5039),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Accession: ' + accession,
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(Icons.person),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Call No: ' + callno,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Stocked at: " + stocked,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding: EdgeInsets.all(20),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pages :' + pages,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Year:' + year,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Edition :' + edition,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
