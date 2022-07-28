import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_management/routes/routes.dart';
import 'package:library_management/widgets/Refresh/liquid_pull.dart';

import '../../widgets/CustomMessage/custom_message.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _firebaseUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // _authorizeAdmin();
  }

  @override
  void onReady() {
    super.onReady();
    _firebaseUser = Rx<User?>(auth.currentUser);
    // print("Hello");
    // print(_firebaseUser);

    //our user will be notified
    _firebaseUser.bindStream(auth.userChanges());

    // ever(_firebaseUser, _authorizeAdmin);
  }
// User? user
  // _setInitialScreen() {

  // if (user == null) {
  //   print("Welcome page");
  //   Get.offAllNamed(AppRoutes.welcomeRoute);
  // } else {
  //   // Get.offAll(() => HomePage(email: user.email!));
  //   Get.offAllNamed(AppRoutes.homeRoute);
  // }

  // }

  //  _authorizeAdmin(User? user) async{
  //   DocumentSnapshot snap =
  //   await FirebaseFirestore.instance.
  //   collection('users').doc(auth.currentUser!.uid).get();
  //   if(_firebaseUser == (snap.data() as Map<String,dynamic>)['user']){
  //     print("yyuuii");
  //   Get.offAllNamed(AppRoutes.rootRoute);
  //   }
  //   // _value  = (snap.data() as Map<String,dynamic>)['user'];

  // }

  // authorizeAdmin() {
  //   auth.currentUser!.then((user) {
  //     FirebaseFirestore.instance
  //         .collection('users')
  //         .where('uid', isEqualTo: user.uid)
  //         .get()
  //         .then((docs) {
  //       if (docs.docChanges[0].exists) {
  //         if (docs.documents[0].data['role'] == 'admin') {
  //           Get.toNamed(AppRoutes.rootRoute);
  //           // Navigator.push(
  //           //     context,
  //           //     new MaterialPageRoute(
  //           //         builder: (BuildContext context) => new AdminPage()));
  //         } else {
  //           print('Not Authorized');
  //         }
  //       }
  //     });
  //   });
  // }

  void login(String email, password) async {
    try {
      // showLoading();
      LiquidRefresh();
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((result) {
        Get.offAllNamed(AppRoutes.homeRoute);

        // String _userId = result.user.uid;
        // _initializeUserModel(_userId);
        // _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      showCustomSnackBar(
        // e.toString(),
        "Invalid Credentials",
        title: "Login failed",
      );
    }
  }

  void logOut() async {
    await auth
        .signOut()
        .then((result) => Get.offAllNamed(AppRoutes.welcomeRoute));
  }
}
