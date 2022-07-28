import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management/widgets/Refresh/liquid_pull.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/firebase.dart';
import '../../../../routes/routes.dart';
import '../../../../widgets/CustomMessage/custom_message.dart';
import '../../../../widgets/CustomText/custom_text.dart';

class AdminRegisterPage extends StatefulWidget {
  const AdminRegisterPage({Key? key}) : super(key: key);

  @override
  State<AdminRegisterPage> createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {
  @override
  Widget build(BuildContext context) {
    var _nameController = TextEditingController();
    var _emailController = TextEditingController();
    var _passController = TextEditingController();
    var _repassController = TextEditingController();

    bool adminRegisterValidate() {
      if (true) {
        if (_nameController.text.trim().isEmpty) {
          showCustomSnackBar("Type in your Name", title: "Name Empty!");
        } else if (!GetUtils.isUsername(_nameController.text.trim())) {
          showCustomSnackBar("Type in your Name", title: "Name Invalid");
        } else if (_emailController.text.trim().isEmpty) {
          showCustomSnackBar("Type in your Email", title: "Email Empty!");
        } else if (!GetUtils.isEmail(_emailController.text.trim())) {
          showCustomSnackBar("Type in your valid Email",
              title: "Invalid Email");
        } else if (_passController.text.trim().isEmpty) {
          showCustomSnackBar("Type in your Password", title: "Password Empty!");
        } else if (_passController.text.trim().length < 6) {
          showCustomSnackBar("Password cannot be less than six characters",
              title: "Password to short!");
        } else if (_repassController.text.trim().isEmpty) {
          showCustomSnackBar("Type in your Password again",
              title: "Confirmation Password Empty!");
        }
      }
      //  else {
      //   showCustomSnackBar(
      //     "Email has already been taken",
      //     title: "Account creation failed",
      //   );
      // }
      return true;
    }

    Future addadminuserDetailsFirst(
      String userId,
      email,
      name,
    ) async {
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        "name": name,
        "email": email,
        "department": "",
        "contact": "",
        "enrollment": "",
        "year": "",
        "role": "admin"
      });
    }

    Future adminRegister(String email, password) async {
      // showLoading();
      // LiquidRefresh();
      try {
        await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((result) {
          LiquidRefresh();

          // updateUserName(_nameController.text.trim(), currentUser)

          String _userId = result.user!.uid;
          addadminuserDetailsFirst(
            _userId,
            _emailController.text.trim(),
            _nameController.text.trim(),
          );
          Get.toNamed(AppRoutes.homeRoute);
        });
      } catch (e) {
        debugPrint(e.toString());
        showCustomSnackBar(
          "Invalid credential",
          title: "Account creation failed",
        );
      }
    }

    bool passwordConfirmed() {
      if (_passController.text.trim() == _repassController.text.trim()) {
        return true;
      } else {
        return false;
      }
    }

    @override
    void dispose() {
      _nameController.dispose();
      _emailController.dispose();
      _passController.dispose();
      _repassController.dispose();

      // TODO: implement dispose
      super.dispose();
    }

    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Center(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      // child: Image.asset("assets/icons/user1.png"),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text("Register",
                        style: GoogleFonts.roboto(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Register Me!",
                      color: AppColor.lightGrey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Your Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "abc@domain.com",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "123",
                      prefixIcon: Icon(Icons.key),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _repassController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "123",
                      prefixIcon: Icon(Icons.key),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        CustomText(
                          text: "Remember Me",
                          color: AppColor.black,
                        ),
                      ],
                    ),
                    CustomText(text: "Forgot password?", color: AppColor.active)
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    if (adminRegisterValidate() && passwordConfirmed()) {
                      adminRegister(_emailController.text.trim(),
                          _passController.text.trim());
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.active,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: CustomText(
                      text: "Register",
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.authenticationPageRoute);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.active,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: CustomText(
                      text: "Login",
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //   RichText(
                //     text: TextSpan(
                //       children: [
                //         TextSpan(text: "Do not have admin credentials? "),
                //         TextSpan(
                //             text: "Request Credentials! ",
                //             style: TextStyle(color: AppColor.active))
                //       ],
                //     ),
                //   ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
