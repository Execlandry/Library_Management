import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/controllers/FirebaseController/bookController.dart';
import 'package:library_management/pages/userUi/book_card.dart';

class BookPage extends GetView<BookController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => ListView.builder(
          shrinkWrap: true,
          itemCount: controller.books.length,
          itemBuilder: ((context, index) => BookCard(
                accession:
                    controller.books[index].accessionNo!.capitalize!.trim(),
                title: controller.books[index].title!.capitalize!.trim(),
                callno: controller.books[index].callNo!.trim(),
                edition: controller.books[index].edition!.trim(),
                pages: controller.books[index].pages!.trim(),
                year: controller.books[index].year!.trim(),
                stocked: controller.books[index].stockedAt!.trim(),
              )))),
    );
  }
}
