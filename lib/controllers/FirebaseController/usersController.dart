import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/common/firebase.dart';
import 'package:library_management/models/user_model.dart';

import '../../pages/dashboard/DisplayData/widgets/customFullScreenDialog.dart';
import '../../pages/dashboard/DisplayData/widgets/customSnackBar.dart';

class UsersController extends GetxController {
  static UsersController instance = Get.find();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

//defining controllers for form input fields
  late TextEditingController nameController,
      emailController,
      departmentController,
      contactController,
      enrollmentController,
      yearController,
      userDataSearchController;

  late CollectionReference collectionReference;

/*get the stream from usermodel and store it as list in users variable */
  RxList<UserModel> users = RxList<UserModel>([]);

  // var searchList = List.empty(growable: true).obs;
  // RxList<List> searchList = RxList<List>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    departmentController = TextEditingController();
    contactController = TextEditingController();
    enrollmentController = TextEditingController();
    yearController = TextEditingController();

    userDataSearchController = TextEditingController();

    collectionReference = firebaseFirestore.collection("users");
    users.bindStream(getAllUsers());
    // searchList.add(getAllUsers());
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Name can not be empty";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email can not be empty";
    }
    return null;
  }

  void saveUpdateEmployee(
      String name,
      String email,
      String docId,
      int addEditFlag,
      String department,
      String contactNumber,
      String enrollment,
      String year) {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formkey.currentState!.save();
    if (addEditFlag == 1) {
      CustomFullScreenDialog.showDialog();

      collectionReference.add({'name': name, 'email': email}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "User Added",
            message: "User added successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.red);
      });
    } else if (addEditFlag == 2) {
      //update
      CustomFullScreenDialog.showDialog();
      collectionReference.doc(docId).update({
        'name': name,
        'email': email,
        'department': department,
        'contact': contactNumber,
        'enrollment': enrollment,
        'year': year
      }).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "User Updated",
            message: "User updated successfully",
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
    nameController.dispose();
    emailController.dispose();
    departmentController.dispose();
    contactController.dispose();
    enrollmentController.dispose();
    yearController.dispose();
    userDataSearchController.dispose();
  }

  void clearEditingControllers() {
    nameController.clear();
    emailController.clear();
    departmentController.clear();
    contactController.clear();
    enrollmentController.clear();
    yearController.clear();
    userDataSearchController.clear();
  }

//iterating or maping through data in database
  Stream<List<UserModel>> getAllUsers() => collectionReference.snapshots().map(
      (query) => query.docs.map((item) => UserModel.fromMap(item)).toList());

  void deleteData(String docId) {
    CustomFullScreenDialog.showDialog();
    collectionReference.doc(docId).delete().whenComplete(() {
      CustomFullScreenDialog.cancelDialog();
      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Employee Deleted",
          message: "Employee deleted successfully",
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


//  void getSearch(String inputString) {
//     // searchList = users.where((p0) => false).get
    
//   }

  /*Add Search Functionality */
  // getSearch(String query) async {
  //   await FirebaseFirestore.instance
  //       .collection("users")
  //       .where("email", isEqualTo: query)
  //       .get();
  // .then((value) => userMap = value.docs[0].data());
  // print(userMap);
  // userMap != null
  //     ? ListTile(
  //         // onTap: onResultTap,
  //         leading: Icon(Icons.account_box),
  //         title: Text(userMap!['name']),
  //         subtitle: Text(userMap!['email']),
  //         trailing: Icon(Icons.add),
  //       )
  //     : SizedBox();
  // }
}
