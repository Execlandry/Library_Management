import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:library_management/routes/routes.dart';
import 'package:library_management/widgets/CustomMessage/custom_message.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _firebaseUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoggedIn = false.obs;

  // TextEditingController name = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController password = TextEditingController();
  // String usersCollection = "users";
  // Rx<UserModel> userModel = UserModel(email: '', name: '').obs;

  @override
  void onReady() {
    super.onReady();
    _firebaseUser = Rx<User?>(auth.currentUser);
    //our user will be notified
    _firebaseUser.bindStream(auth.userChanges());

    ever(_firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      print("Welcome page");
      Get.offAllNamed(AppRoutes.welcomeRoute);
    } else {
      // Get.offAll(() => HomePage(email: user.email!));
      Get.offAllNamed(AppRoutes.homeRoute);
    }
  }

  void register(String email, password) async {
    // showLoading();
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // .then((result) {
      // String _userId = result.user.uid;
      // _addUserToFirestore(_userId);
      // _initializeUserModel(_userId);
      // _clearControllers();
      // }
      // );
    } catch (e) {
      debugPrint(e.toString());
      // showCustomSnackBar(
      //   "Invalid credential",
      //   title: "Account creation failed",
      // );
    }
  }

  void login(String email, password) async {
    try {
      // showLoading();
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((result) {
        // String _userId = result.user.uid;
        // _initializeUserModel(_userId);
        // _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      // showCustomSnackBar(
      //   e.toString(),
      //   title: "Login failed",
      // );
    }
  }

  void logOut() async {
    await auth.signOut();
  }

  // _clearControllers(){
  //   name.clear();
  //   email.clear();
  //   password.clear();
  // }
}
