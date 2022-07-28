import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:library_management/controllers/FirebaseController/authorController.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../../../models/author_model.dart';

class AuthorsDropdown extends GetView<AuthorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MultiSelectDialogField(
              listType: MultiSelectListType.LIST,
              chipDisplay: MultiSelectChipDisplay.none(),
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 3, 71, 62),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  // color: Color.fromARGB(255, 3, 71, 62),
                  width: 2,
                ),
              ),
              buttonIcon: Icon(Icons.add
                  // color: Color.fromARGB(255, 3, 71, 62),
                  ),
              buttonText: Text(
                "Authors/Publisher",
                style: TextStyle(
                  // color: Color.fromARGB(255, 3, 71, 62),
                  fontSize: 16,
                ),
              ),
              items: controller.authors
                  .map((player) =>
                      MultiSelectItem<Authors>(player, player.name!))
                  .toList(),
              searchHint: "All Authors/Publishers",
              selectedColor: Color.fromARGB(255, 3, 71, 62),
              searchable: true,
              onConfirm: (results) {
                // controller.selectedAuthor = results;
                // print(controller.selectedAuthor);
                // controller.selectedAuthorValue.value = "";
                // controller.selectedAuthor.forEach((element) {
                //   controller.selectedAuthorValue.value =
                //       controller.selectedAuthorValue.value + " " + element.name;
                // }
              },
            ),
            SizedBox(
              height: 40,
            ),
            Obx(() => Text(controller.selectedAuthorValue.value)),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.showMultiSelect();
                },
                child: Text('Show'))
          ],
        ),
      ),
    );
  }
}
