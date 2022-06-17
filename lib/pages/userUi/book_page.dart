// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:library_management/controllers/FirebaseController/bookController.dart';
// import 'package:library_management/pages/userUi/cardsui.dart';

// class BookPage extends GetView<BookController> {
//   @override
//   Widget build(BuildContext context) {
//     return Obx((() => ListView.builder(
//           shrinkWrap: true,
//           // itemCount: controller.books.length,
//           itemCount: 3,

//           itemBuilder: (context, index) => Card(
//             shadowColor: Colors.cyan,
//             shape: RoundedRectangleBorder(
//               side: BorderSide(
//                 color: Colors.black,
//                 width: 2.0,
//               ),
//               borderRadius: BorderRadius.circular(25),
//             ),
//             elevation: 12,
//             color: Color.fromARGB(255, 150, 157, 177),
//             child: BookCard(
//               // accession: controller.books[index].accessionNo!.capitalize!.trim(),
//               // bookTitle: controller.books[index].title!.trim(),
//               // callNo:
//               //     controller.books[index].callNo!.capitalize!.trim(),
//               // pages: controller.books[index].pages!.trim(),
//               // year: controller.books[index].year!.trim(),
//               // edition: controller.books[index].edition!.trim(),
//             ),
//           ),
//         )));
//   }
// }
