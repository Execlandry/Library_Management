import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/FirebaseController/usersController.dart';

class UserCard extends GetView<UsersController> {
  final String fullName;
  final String email;
  final String department;
  final String contactNumber;
  final String enrollment;
  final String year;
  final color;
  // final GestureTapCallback? onTap;
  // final Function onTap;
  UserCard({
    Key? key,
    required this.fullName,
    required this.email,
    required this.department,
    required this.contactNumber,
    required this.enrollment,
    required this.year,
    this.color,
    // required this.onTap,
    /*required this.onTap*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
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
                  department,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Text(
                  year + " year",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              enrollment.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              fullName,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contactNumber.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     IconButton(
                //       onPressed: () {
                //     // displayDeleteDialog(controller.users[index].docId!);

                //       },
                //       icon: Icon(
                //         Icons.delete_forever,
                //         color: Colors.red,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
