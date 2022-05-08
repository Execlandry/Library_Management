import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library_management/controllers/FirebaseController/usersController.dart';

//using GetView<UsersController> we can use Userscontroller properties without creating its instance
class StudentsTable extends GetView<UsersController> {
  const StudentsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //search bar
        // TextFormField(
        //   onChanged: (search) {
        //     controller.getSearch(search);
        //   },
        //   decoration: InputDecoration(
        //     hintText: "Search",
        //     contentPadding: EdgeInsets.all(12),
        //     hintStyle: TextStyle(
        //       fontSize: 13,
        //     ),
        //     border: InputBorder.none,
        //     fillColor: Colors.transparent,
        //   ),
        // ),
        SizedBox(
          height: 10,
        ),
        Container(
            child: Obx(
          (() => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.users.length,
                itemBuilder: (context, index) => Card(
                    color: Color.fromARGB(255, 150, 157, 177),
                    child: ListTile(
                        title: Text(controller.users[index].name!),
                        subtitle: Text(controller.users[index].email!),
                        leading: CircleAvatar(
                          child: Text(
                            controller.users[index].name!
                                .substring(0, 1)
                                .capitalize!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.yellow,
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            displayDeleteDialog(controller.users[index].docId!);
                          },
                        ),
                        onTap: () {
                          controller.nameController.text =
                              controller.users[index].name!;
                          controller.emailController.text =
                              controller.users[index].email!;

                          _buildAddEditEmployeeView(
                              text: 'Update',
                              addEditFlag: 2,
                              docId: controller.users[index].docId!);
                        })),
              )),
        )),
      ],
    );
  }

  _buildAddEditEmployeeView({String? text, int? addEditFlag, String? docId}) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          color: Color(0xff1E2746),
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
                    '${text} User Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.nameController,
                    validator: (value) {
                      return controller.validateName(value!);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.emailController,
                    validator: (value) {
                      return controller.validateEmail(value!);
                    },
                  ),
                  SizedBox(
                    height: 8,
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
                        controller.saveUpdateEmployee(
                            controller.nameController.text,
                            controller.emailController.text,
                            docId!,
                            addEditFlag!);
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
      title: "Delete User",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Are you sure to delete User ?',
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
