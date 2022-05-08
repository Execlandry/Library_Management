import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/common/firebase.dart';
import 'package:library_management/models/user_model.dart';

import '../../pages/dashboard/DisplayData/widgets/customFullScreenDialog.dart';
import '../../pages/dashboard/DisplayData/widgets/customSnackBar.dart';

class UsersController extends GetxController {
  static UsersController instance = Get.find();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  late TextEditingController nameController,
      emailController,
      userDataSearchController;

  late CollectionReference collectionReference;

/*get the stream from usermodel and store it as list in users variable */
  RxList<UserModel> users = RxList<UserModel>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    userDataSearchController = TextEditingController();

    collectionReference = firebaseFirestore.collection("users");
    users.bindStream(getAllUsers());
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
      String name, String email, String docId, int addEditFlag) {
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
            backgroundColor: Colors.green);
      });
    } else if (addEditFlag == 2) {
      //update
      CustomFullScreenDialog.showDialog();
      collectionReference
          .doc(docId)
          .update({'name': name, 'email': email}).whenComplete(() {
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
    userDataSearchController.dispose();
  }

  void clearEditingControllers() {
    nameController.clear();
    emailController.clear();
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

  /*Add Search Functionality */
  // getSearch(String query) async{
  //   FirebaseFirestore.instance.collection("users").where("email");
  // }
}
