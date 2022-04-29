import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management/controllers/AuthController/auth_controller.dart';
import 'package:library_management/models/signup_body_model.dart';
import 'package:library_management/widgets/CustomMessage/custom_message.dart';
import 'package:library_management/widgets/Refresh/liquid_pull.dart';

import '../../../../common/app_colors.dart';
import '../../../../routes/routes.dart';
import '../../../../widgets/CustomText/custom_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _passController = TextEditingController();
    TextEditingController _repassController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _nameController = TextEditingController();

    void _registration(AuthController authController) {
      String name = _nameController.text.trim();
      String email = _emailController.text.trim();
      String password = _passController.text.trim();
      String cPassword = _repassController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your Name", title: "Name Empty!");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your Email", title: "Email Empty!");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in your valid Email", title: "Email");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your Password", title: "Password Empty!");
      } else if (password.length < 6) {
        showCustomSnackBar("Password cannot be less than six characters",
            title: "Password");
      } else if (cPassword.isEmpty) {
        showCustomSnackBar("Type in your Password again",
            title: "Confirmation Password Empty!");
      } else if (cPassword.length < 6) {
        showCustomSnackBar("Password cannot be less than six characters",
            title: "Password");
      } else {
        SignUpBody signUpBody = SignUpBody(
            name: name, email: email, password: password, /*password_confirmation: cPassword*/);

        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Success registration");
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<AuthController>(builder:(_authController){
        return !_authController.isLoading? Center(
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
                  _registration(_authController);
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
                  Get.offAllNamed(RootRoute);
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
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: "Do not have admin credentials? "),
                TextSpan(
                    text: "Request Credentials! ",
                    style: TextStyle(color: AppColor.active))
              ]))
            ],
          ),
        ),
      ):LiquidRefresh();
    
      })
    );
  }
}

