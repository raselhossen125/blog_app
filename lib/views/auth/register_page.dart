// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
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
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      cursorColor: appColor,
                      obscureText: isObsucure,
                      style:
                          TextStyle(color: appColor, fontWeight: FontWeight.w500),
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
                      onTap: () {
                        Get.offNamed(MyAppRoutes.blogPageRoute);
                      },
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
                    SizedBox(height: 30),
                    Text(
                      'or',
                      style: mediamBold,
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/google2.png', height: 40, width: 40),
                        SizedBox(width: 20),
                        Image.asset('images/fb2.png', height: 40, width: 40),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
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