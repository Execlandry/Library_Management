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
            itemCount: controller.foundBooks.value.length,
            itemBuilder: ((context, index) => BookCard(
                  accession: controller
                      .foundBooks[index].accessionNo!.capitalize!
                      .trim(),
                  title: controller.foundBooks[index].title!.capitalize!.trim(),
                  callno: controller.foundBooks[index].callNo!.trim(),
                  edition: controller.foundBooks[index].edition!.trim(),
                  pages: controller.foundBooks[index].pages!.trim(),
                  year: controller.foundBooks[index].year!.trim(),
                  stocked: controller.foundBooks[index].stockedAt!.trim(),
                )),
          )),
    );
  }
}
