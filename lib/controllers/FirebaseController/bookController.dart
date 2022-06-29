import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/common/firebase.dart';
import 'package:library_management/models/book_model.dart';

import '../../pages/dashboard/DisplayData/widgets/customFullScreenDialog.dart';
import '../../pages/dashboard/DisplayData/widgets/customSnackBar.dart';

class BookController extends GetxController {
  static BookController instance = Get.find();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var currentStep = 0.obs;
  late TextEditingController accessionNoController,
      titleController,
      authorController,
      placeController,
      editionController,
      yearController,
      pagesController,
      sourceController,
      billNoController,
      billDateController,
      costController,
      callNoController,
      stockedatController;

  late CollectionReference collectionReference;

  RxList<BookModel> books = RxList<BookModel>([]);
  //search
  RxList<BookModel> foundBooks = RxList<BookModel>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    accessionNoController = TextEditingController();
    titleController = TextEditingController();
    authorController = TextEditingController();
    placeController = TextEditingController();
    editionController = TextEditingController();
    yearController = TextEditingController();
    pagesController = TextEditingController();
    sourceController = TextEditingController();
    billNoController = TextEditingController();
    billDateController = TextEditingController();
    costController = TextEditingController();
    callNoController = TextEditingController();
    stockedatController = TextEditingController();

    collectionReference = firebaseFirestore.collection("books");
    books.bindStream(getAllBooks());
    //search
    foundBooks.value = books;
  }

  void saveBook(
      String docId,
      int addEditFlag,
      String accessionNo,
      String title,
      String author,
      String place,
      String edition,
      String year,
      String pages,
      String source,
      String billNo,
      String billDate,
      String cost,
      String callNo,
      String stockedAt) {
    // final isValid = formkey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    // formkey.currentState!.save();

    if (addEditFlag == 1) {
      CustomFullScreenDialog.showDialog();

      collectionReference.add({
        'accessionNo': accessionNo,
        'title': title,
        'author': author,
        'place': place,
        'edition': edition,
        'year': year,
        'pages': pages,
        'source': source,
        'billNo': billNo,
        'billDate': billDate,
        'cost': cost,
        'callNo': callNo,
        'stockedAt': stockedAt
      }).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Book Added",
            message: "Book Added successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.red);
      });
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    accessionNoController.dispose();
    titleController.dispose();
    authorController.dispose();
    placeController.dispose();
    editionController.dispose();
    yearController.dispose();
    pagesController.dispose();
    sourceController.dispose();
    billNoController.dispose();
    billDateController.dispose();
    costController.dispose();
    callNoController.dispose();
    stockedatController.dispose();
  }

  void filterBooks(String bookName) {
    List<BookModel> results = [];
    if (bookName.isEmpty) {
      results = books;
    } else {
      results = books
          .where((book) =>
              book.title
                  .toString()
                  .toLowerCase()
                  .contains(bookName.toLowerCase()) ||
              book.accessionNo
                  .toString()
                  .toLowerCase()
                  .contains(bookName.toLowerCase()) ||
              book.stockedAt
                  .toString()
                  .toLowerCase()
                  .contains(bookName.toLowerCase()) ||
              book.callNo
                  .toString()
                  .toLowerCase()
                  .contains(bookName.toLowerCase()) ||
              book.pages
                  .toString()
                  .toLowerCase()
                  .contains(bookName.toLowerCase()) ||
              book.year
                  .toString()
                  .toLowerCase()
                  .contains(bookName.toLowerCase()) ||
              book.author
                  .toString()
                  .toLowerCase()
                  .contains(bookName.toLowerCase()))
          .toList();
    }
    foundBooks.value = results;
  }

  Stream<List<BookModel>> getAllBooks() => collectionReference.snapshots().map(
      (query) => query.docs.map((item) => BookModel.fromMap(item)).toList());

  void clearEditingControllers() {
    accessionNoController.clear();
    titleController.clear();
    authorController.clear();
    placeController.clear();
    editionController.clear();
    yearController.clear();
    pagesController.clear();
    sourceController.clear();
    billNoController.clear();
    billDateController.clear();
    costController.clear();
    callNoController.clear();
    stockedatController.clear();
  }
}
