import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management/controllers/FirebaseController/authController.dart';
import 'package:library_management/pages/dashboard/DisplayData/Authentication/register.dart';
import 'package:library_management/widgets/CustomMessage/custom_message.dart';

import '../../../../common/app_colors.dart';
import '../../../../routes/routes.dart';
import '../../../../widgets/CustomText/custom_text.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();

    bool loginValidate() {
      if (emailController.text.trim().isEmpty) {
        showCustomSnackBar("Type in your Email", title: "Email Empty!");
      } else if (!GetUtils.isEmail(emailController.text.trim())) {
        showCustomSnackBar("Type in your valid Email", title: "Email");
      } else if (passController.text.trim().isEmpty) {
        showCustomSnackBar("Type in your Password", title: "Password Empty!");
      } else if (passController.text.trim().length < 6) {
        showCustomSnackBar("Password cannot be less than six characters",
            title: "Password");
      }
      return true;
    }

    @override
    void dispose() {
      emailController.dispose();
      passController.dispose();
      // TODO: implement dispose
      super.dispose();
    }

    return Scaffold(
      body: Center(
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
                  Text("Login",
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
                    text: "Welcome back to the admin panel.",
                    color: AppColor.lightGrey,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: emailController,
                validator: (value) =>
                    value!.isEmpty ? "Please Enter Valid Email" : null,
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "abc@domain.com",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true,
                controller: passController,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "123",
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
                  if (loginValidate()) {
                    AuthController.instance.login(emailController.text.trim(),
                        passController.text.trim());
                  }
                },
                // Get.offAllNamed(RootRoute);

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
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.offAllNamed(AppRoutes.registerRoute);

                  // GetPage(name: RegisterRoute, page: () => RegisterPage());
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
      ),
    );
  }
}
