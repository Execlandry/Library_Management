import 'package:flutter/material.dart';

class carddsui extends StatefulWidget {
  const carddsui({Key? key}) : super(key: key);

  @override
  State<carddsui> createState() => _carddsuiState();
}

class _carddsuiState extends State<carddsui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 140, 245, 201),
      body: Column(children: [
        Center(
          child: Container(
            width: 300,
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
                Text(
                  'Accession No.:',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Book Title:',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Call No.:',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pages :',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Year:',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Edition :',
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
