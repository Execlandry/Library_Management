import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import 'autors.dart';
import 'controller.dart';

class View extends GetView<Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiSelectDialog'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MultiSelectDialogField(
              listType: MultiSelectListType.LIST,
              chipDisplay: MultiSelectChipDisplay.none(),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 71, 62),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                border: Border.all(
                  color: Color.fromARGB(255, 3, 71, 62),
                  width: 2,
                ),
              ),
              buttonIcon: Icon(
                Icons.account_box,
                color: Color.fromARGB(255, 3, 71, 62),
              ),
              buttonText: Text(
                "Favorite Players",
                style: TextStyle(
                  color: Color.fromARGB(255, 3, 71, 62),
                  fontSize: 16,
                ),
              ),
              items: controller.authors
                  .map((player) =>
                      MultiSelectItem<Authors>(player, player.name!))
                  .toList(),
              title: Text("AUTHORS"),
              selectedColor: Color.fromARGB(255, 3, 71, 62),
              searchable: true,
              onConfirm: (results) {
                controller.selectedAuthor = results;
                controller.selectedAuthorValue.value = "";
                controller.selectedAuthor.forEach((element) {
                  controller.selectedAuthorValue.value =
                      controller.selectedAuthorValue.value + " " + element.name;
                });
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