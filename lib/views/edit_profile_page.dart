// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:blog_app/route/my_app_routes.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/widgets/my_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/auth_service.dart';
import '../utils/style.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    nameController.text = AuthService.user!.displayName ?? "";
    emailController.text = AuthService.user!.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.check_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                  ),
                  child: Image.asset(
                    'images/image3.jpg',
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appColor.withOpacity(0.6)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: bgColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 145,
                  left: 20,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.7),
                            shape: BoxShape.circle),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: AuthService.user!.photoURL == null
                            ? Image.asset(
                                'images/R.png',
                                height: 140,
                                width: 140,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                AuthService.user!.photoURL!,
                                height: 140,
                                width: 140,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Positioned(
                        left: 120,
                        bottom: 90,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: appColor.withOpacity(0.6)),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: bgColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
              child: Column(
                children: [
                  MyTextField(
                    controller: nameController,
                    hintText: 'Enter updated name',
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(height: 15),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Enter updated name',
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Get.offAllNamed(MyAppRoutes.bottomNavPageRoute);
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
                        'Update',
                        style: btnStyle,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
