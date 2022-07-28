import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../models/author_model.dart';

class AuthorController extends GetxController {
  static AuthorController instance = Get.find();

  List<Authors> authors = [
    Authors(name: "Charles Dickens"),
    Authors(name: "Jane Austen"),
    Authors(name: "William Shakespear"),
    Authors(name: "R.K Narayan"),
    Authors(name: "Vladimir Nabokov"),
    Authors(name: "Mark Twain"),
    Authors(name: "Rabindranath Tagore"),
  ];

  List<dynamic> selectedAuthor = [];
  var selectedAuthorValue = ''.obs;

  void onInit() {
    super.onInit();
  }

  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void showMultiSelect() async {
    await showDialog(
      context: Get.context!,
      builder: (ctx) {
        return MultiSelectDialog(
            listType: MultiSelectListType.LIST,
            initialValue: selectedAuthor,
            items: authors
                .map((author) => MultiSelectItem<Authors>(author, author.name!))
                .toList(),
            // title: Text("AUTHORS"),
            selectedColor: Color.fromARGB(255, 3, 71, 62),
            searchable: true,
            onConfirm: (results) {
              // selectedAuthor = results;
              // selectedAuthorValue.value = "";
              // selectedAuthor.forEach((element) {
              //   selectedAuthorValue.value =
              //       selectedAuthorValue.value + "" + element.name;
              // }
            });
      },
    );
    // });
  }
}
