import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/controllers/FirebaseController/bookController.dart';

import '../../../userUi/book_card.dart';



//using GetView<booksController> we can use bookscontroller properties without creating its instance
class BooksPage extends GetView<BookController> {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.foundBooks.value.length,
            itemBuilder: (context, index) => GestureDetector(
              onLongPress: () =>
                  displayDeleteDialog(controller.foundBooks[index].docId!),
              onTap: () {
                controller.accessionNoController.text =
                    controller.foundBooks[index].accessionNo!;
                controller.titleController.text =
                    controller.foundBooks[index].title!;
                controller.authorController.text =
                    controller.foundBooks[index].author!;
                controller.placeController.text =
                    controller.foundBooks[index].place!;
                controller.editionController.text =
                    controller.foundBooks[index].edition!;
                    
                controller.yearController.text =
                    controller.foundBooks[index].year!;

                    controller.pagesController.text =
                    controller.foundBooks[index].pages!;

                    controller.sourceController.text =
                    controller.foundBooks[index].source!;

                    controller.billNoController.text =
                    controller.foundBooks[index].billNo!;

                    controller.billDateController.text =
                    controller.foundBooks[index].billDate!;

                    controller.costController.text =
                    controller.foundBooks[index].cost!;

                    controller.callNoController.text =
                    controller.foundBooks[index].callNo!;

                    controller.stockedatController.text =
                    controller.foundBooks[index].stockedAt!;

                _buildAddEditbooksView(
                    text: 'Update',
                    addEditFlag: 2,
                    docId: controller.foundBooks[index].docId!);
              },
              child: BookCard(
                accession: controller
                    .foundBooks[index].accessionNo!.capitalize!
                    .trim(),
                author:
                    controller.foundBooks[index].author!.capitalize!.trim(),
                place: controller.foundBooks[index].place!.capitalize!.trim(),
                title: controller.foundBooks[index].title!.capitalize!.trim(),
                callno: controller.foundBooks[index].callNo!.trim(),
                edition: controller.foundBooks[index].edition!.trim(),
                pages: controller.foundBooks[index].pages!.trim(),
                year: controller.foundBooks[index].year!.trim(),
                stocked: controller.foundBooks[index].stockedAt!.trim(),
              ),
              // child: BookCard(
              //   fullName:
              //       controller.foundBooks[index].name!.capitalize!.trim(),
              //   email: controller.foundBooks[index].email!.trim(),
              //   department: controller
              //           .foundBooks[index].department!.capitalize!
              //           .trim() +
              //       " Department",
              //   contactNumber: controller.foundBooks[index].contactNumber!.trim(),
              //   enrollment: controller.foundBooks[index].enrollment!.trim(),
              //   year: controller.foundBooks[index].year!.trim(),
              // ),
            ),
          )),
    );
  }

  _buildAddEditbooksView({String? text, int? addEditFlag, String? docId}) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          color: Color.fromARGB(255, 194, 197, 207),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: Form(
            key: controller.formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${text} Book Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),

                  //Name controller
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Accession',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.accessionNoController,
                    // validator: (value) {
                    //   return controller.validateName(value!);
                    // },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Email controller
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Title of the book',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.titleController,
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                  ),
                  SizedBox(
                    height: 8,
                  ),

                  //Department controller
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Author',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.authorController,
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  //Contact controller
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'place',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.placeController,
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  //Enrollment controller
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Edition',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.editionController,
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  //Year controller
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'year',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.yearController,
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                    TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'pages',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.pagesController
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                  ),
                            SizedBox(
                    height: 8,
                  ),
                    TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'source',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.sourceController
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                  ),
                            SizedBox(
                    height: 8,
                  ),
                    TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Bill Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.billNoController
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                  ),
                            SizedBox(
                    height: 8,
                  ),
                    TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Bill Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.pagesController
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                  ),
                            SizedBox(
                    height: 8,
                  ),
                    TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Cost',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.costController
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                  ),
                            SizedBox(
                    height: 8,
                  ),
                    TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Call Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.callNoController
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                  ),
                            SizedBox(
                    height: 8,
                  ),
                    TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Stocked at',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.stockedatController
                    // validator: (value) {
                    //   return controller.validateEmail(value!);
                    // },
                  ),

                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.context!.width, height: 45),
                    child: ElevatedButton(
                      child: Text(
                        text!,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onPressed: () {
                        controller.saveUpdateBook(
                          docId!,
                          addEditFlag!,
                          controller.accessionNoController.text,
                          controller.titleController.text,
                          // docId!,
                          // addEditFlag!,
                          controller.authorController.text,
                          controller.placeController.text,
                          controller.editionController.text,
                          controller.yearController.text,
                          controller.pagesController.text,
                          controller.sourceController.text,
                          controller.billNoController.text,
                          controller.billDateController.text,
                          controller.costController.text,
                          controller.callNoController.text,
                          controller.stockedatController.text,



                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  displayDeleteDialog(String docId) {
    Get.defaultDialog(
      title: "Delete Book",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Are you sure to delete Book ?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.black,
      onCancel: () {},
      onConfirm: () {
        controller.deleteData(docId);
      },
    );
  }
}
