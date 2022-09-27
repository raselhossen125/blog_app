// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable

import 'package:blog_app/controlers/user_controler.dart';
import 'package:blog_app/route/my_app_routes.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/auth_service.dart';

class MainDrawer extends StatelessWidget {
  final userController = Get.put(UserControler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          topRight: Radius.circular(25),
        )),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: appColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: AuthService.user!.photoURL !=null ? Image.network(
                      AuthService.user!.photoURL!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ) : Image.asset(
                      'images/R.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      'Not available',
                      style: smallBoldW,
                    ),
                  ),
                  Text(
                    AuthService.user!.email!,
                    style: smallBoldW,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.toNamed(MyAppRoutes.profilePageRoute);
                    },
                    leading: Icon(
                      Icons.person,
                      color: iconColor,
                    ),
                    title: Text(
                      'Profile',
                      style: smallBold,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      
                    },
                    leading: Icon(
                      Icons.search,
                      color: iconColor,
                    ),
                    title: Text(
                      'Search',
                      style: smallBold,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      AuthService.logOut();
                      Get.offAllNamed(MyAppRoutes.launcherPageRoute);
                    },
                    leading: Icon(
                      Icons.logout,
                      color: iconColor,
                    ),
                    title: Text(
                      'LogOut',
                      style: smallBold,
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
