import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/firebase.dart';
import '../../../../routes/routes.dart';
import '../../../../widgets/CustomMessage/custom_message.dart';
import '../../../../widgets/CustomText/custom_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var repassController = TextEditingController();

    bool registerValidate() {
      if (true) {
        if (nameController.text.trim().isEmpty) {
          showCustomSnackBar("Type in your Name", title: "Name Empty!");
        } else if (!GetUtils.isUsername(nameController.text.trim())) {
          showCustomSnackBar("Type in your Name", title: "Name Invalid");
        } else if (emailController.text.trim().isEmpty) {
          showCustomSnackBar("Type in your Email", title: "Email Empty!");
        } else if (!GetUtils.isEmail(emailController.text.trim())) {
          showCustomSnackBar("Type in your valid Email",
              title: "Invalid Email");
        } else if (passController.text.trim().isEmpty) {
          showCustomSnackBar("Type in your Password", title: "Password Empty!");
        } else if (passController.text.trim().length < 6) {
          showCustomSnackBar("Password cannot be less than six characters",
              title: "Password to short!");
        } else if (repassController.text.trim().isEmpty) {
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

    Future adduserDetailsFirst(
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
        "role" : "user"
      });
    }

    Future register(String email, password) async {
      // showLoading();
      try {
        await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((result) {
          // updateUserName(nameController.text.trim(), currentUser)

          String _userId = result.user!.uid;
          adduserDetailsFirst(
            _userId,
            emailController.text.trim(),
            nameController.text.trim(),
          );
          Get.toNamed(AppRoutes.homeRoute);
        });
      } catch (e) {
        debugPrint(e.toString());
        // showCustomSnackBar(
        //   "Invalid credential",
        //   title: "Account creation failed",
        // );
      }
    }

    bool passwordConfirmed() {
      if (passController.text.trim() == repassController.text.trim()) {
        return true;
      } else {
        return false;
      }
    }

    @override
    void dispose() {
      nameController.dispose();
      emailController.dispose();
      passController.dispose();
      repassController.dispose();

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
                  controller: nameController,
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
                  controller: emailController,
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
                  controller: passController,
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
                  controller: repassController,
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
                    if (registerValidate() && passwordConfirmed()) {
                      register(emailController.text.trim(),
                          passController.text.trim());
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
