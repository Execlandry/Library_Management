import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:library_management/controllers/FirebaseController/usersController.dart';
import 'package:library_management/pages/dashboard/DisplayData/Approved_Students/widget/user_card.dart';

//using GetView<UsersController> we can use Userscontroller properties without creating its instance
class UsersPage extends GetView<UsersController> {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.foundUsers.value.length,
            itemBuilder: (context, index) => Card(
              shadowColor: Colors.cyan,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 12,
              color: Color.fromARGB(255, 150, 157, 177),
              child: GestureDetector(
                onTap: () {
                  controller.nameController.text =
                      controller.users[index].name!;
                  controller.emailController.text =
                      controller.users[index].email!;
                  controller.departmentController.text =
                      controller.users[index].department!;
                  controller.contactController.text =
                      controller.users[index].contactNumber!;
                  controller.enrollmentController.text =
                      controller.users[index].enrollment!;
                  controller.yearController.text =
                      controller.users[index].year!;

                  _buildAddEditUsersView(
                      text: 'Update',
                      addEditFlag: 2,
                      docId: controller.users[index].docId!);
                },
                child: UserCard(
                  fullName: controller.foundUsers[index].name!.capitalize!.trim(),
                  email: controller.foundUsers[index].email!.trim(),
                  department:
                      controller.foundUsers[index].department!.capitalize!.trim() +
                          " Department",
                  contactNumber: controller.users[index].contactNumber!.trim(),
                  enrollment: controller.foundUsers[index].enrollment!.trim(),
                  year: controller.foundUsers[index].year!.trim(),
                ),
              ),
                //  IconButton(
                //   icon: Icon(
                //     Icons.delete_forever,
                //     color: Colors.red,
                //   ),
                //   onPressed: () {
                //     displayDeleteDialog(controller.users[index].docId!);
                //   },
                // ),

              // child: ListTile(
              //   title: Text(controller.users[index].name!),
              //   subtitle: Text(controller.users[index].email!),
              //   leading: CircleAvatar(
              //     child: Text(
              //       controller.users[index].name!.substring(0, 1).capitalize!,
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //     backgroundColor: Colors.yellow,
              //   ),
              //   onTap: () {
              //     controller.nameController.text =
              //         controller.users[index].name!;
              //     controller.emailController.text =
              //         controller.users[index].email!;
              //     controller.departmentController.text =
              //         controller.users[index].department!;
              //     controller.contactController.text =
              //         controller.users[index].contactNumber!;
              //     controller.enrollmentController.text =
              //         controller.users[index].enrollment!;
              //     controller.yearController.text =
              //         controller.users[index].year!;

              //     _buildAddEditUsersView(
              //         text: 'Update',
              //         addEditFlag: 2,
              //         docId: controller.users[index].docId!);
              //   },
              // ),
            ),
          )),
    );
    // ],
  }

  _buildAddEditUsersView({String? text, int? addEditFlag, String? docId}) {
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
                    '${text} User Details',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),

                  //Name controller
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
                  //Email controller
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

                  //Department controller
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Department',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.departmentController,
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
                      hintText: 'Contact Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.contactController,
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
                      hintText: 'Enrollment Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.enrollmentController,
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
                          addEditFlag!,
                          controller.departmentController.text,
                          controller.contactController.text,
                          controller.enrollmentController.text,
                          controller.yearController.text,
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
