// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, empty_catches, avoid_print, unnecessary_null_comparison

import 'package:blog_app/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../route/my_app_routes.dart';
import '../../utils/colors.dart';
import '../../utils/style.dart';
import '../../widgets/my_textField.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isVisible = true;
  bool isObsucure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ClipPath(
                clipper: MyCliper(),
                child: Container(
                  alignment: Alignment.center,
                  height: 280,
                  width: double.infinity,
                  color: appColor,
                  child: Text(
                    'Register',
                    style: verylargeBoldw,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Column(
                  children: [
                    MyTextField(
                      controller: nameController,
                      hintText: 'Enter your name',
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: 15),
                    MyTextField(
                      controller: emailController,
                      hintText: 'Enter your email',
                      prefixIcon: Icons.email,
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      key: formkey,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      cursorColor: appColor,
                      obscureText: isObsucure,
                      style: TextStyle(
                          color: appColor, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.1),
                        contentPadding: EdgeInsets.only(left: 10),
                        focusColor: Colors.grey.withOpacity(0.1),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: iconColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                              if (isVisible) {
                                setState(() {
                                  isObsucure = true;
                                });
                              } else {
                                setState(() {
                                  isObsucure = false;
                                });
                              }
                            });
                          },
                          icon: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                            color: iconColor,
                          ),
                        ),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field must not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 35),
                    InkWell(
                      onTap: _authenticate,
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: btnColor,
                        ),
                        child: Text(
                          'Register',
                          style: btnStyle,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already you have an account?  ',
                          style: smallNormal,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offNamed(MyAppRoutes.logInPageRoute);
                          },
                          child: Text(
                            'LogIn',
                            style: mediamBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _authenticate() async {
    if (nameController.text == null || nameController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your name');
      return;
    }
    if (emailController.text == null || emailController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your email');
      return;
    }
    if (passwordController.text == null || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your password');
      return;
    }
    try {
      EasyLoading.show(status: 'Please wait');
      AuthService.register(
        nameController.text,
        emailController.text,
        passwordController.text,
      ).then((value) {
        Get.offAllNamed(MyAppRoutes.launcherPageRoute);
        EasyLoading.dismiss();
      });
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
        Get.snackbar('Error', e.message!);
        print(e.message!);
    }
  }
}

class MyCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // return Path()
    //   ..lineTo(0, size.height)
    //   ..quadraticBezierTo(
    //     size.width / 4,
    //     size.height - 40,
    //     size.width / 2,
    //     size.height - 20,
    //   )
    //   ..quadraticBezierTo(
    //     3 / 4 * size.width,
    //     size.height,
    //     size.width,
    //     size.height - 30,
    //   )
    //   ..lineTo(size.width, 0);
    Path path = Path();
    path.lineTo(0, size.height / 2);
    path.cubicTo(
      size.width / 4,
      3 * (size.height / 2),
      3 * (size.height / 4),
      size.height / 2,
      size.width,
      size.height * 0.9,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
