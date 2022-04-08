import 'package:flutter/material.dart';
import 'package:library_management/common/app_colors.dart';

class DisplayDataWidget extends StatefulWidget {
  const DisplayDataWidget({Key? key}) : super(key: key);

  @override
  _DisplayDataWidget createState() => _DisplayDataWidget();
}

class _DisplayDataWidget extends State<DisplayDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Members and Issuers",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.black,
                fontSize: 22,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.yellow,
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Text(
                "View All",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.black),
              ),
            )
          ],
        ),
        // ignore: prefer_const_constructors
        Divider(
          thickness: 0.5,
          color: Colors.grey,
        ),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            //Table Header
            TableRow(
              decoration: const BoxDecoration(
                // ignore: unnecessary_const
                border: const Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              children: [
                tableHeader("Full Name"),
                tableHeader("Designation"),
                tableHeader("Status"),
                // tableHeader(""),
              ],
            ),

            tableRow(context,
                name: "Nikhil kerkar",
                color: Colors.green,
                // image: "assets/user1.png",
                designation: "Laravel Developer",
                status: "Final Round"),
            tableRow(context,
                name: "Nikhil kerkar",
                color: Colors.green,
                // image: "assets/user1.png",
                designation: "Laravel Developer",
                status: "Final Round"),
            tableRow(context,
                name: "Nikhil kerkar",
                color: Colors.green,
                // image: "assets/user1.png",
                designation: "Laravel Developer",
                status: "Final Round"),
          ],
        ),
      ]),
    );
  }

  TableRow tableRow(context, {name, designation, status, color}) {
    return TableRow(
      decoration: const BoxDecoration(
        // ignore: unnecessary_const
        border: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      children: [
        //Full Name
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(1000),
              //   child: Image.asset(
              //     // image,
              //     width: 30,
              //   ),
              // ),
              const SizedBox(
                width: 10,
              ),
              Text(name),
            ],
          ),
        ),
        //Designation
        Text(designation),
        //Status
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.yellow,
              ),
              height: 10,
              width: 10,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(status)
          ],
        ),
        //Menu icon
        // Image.asset(
        //   "assets/more.png",
        //   color: Colors.grey,
        //   height: 30,
        // )
      ],
    );
  }

  Widget tableHeader(text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColor.black,
        ),
      ),
    );
  }
}
