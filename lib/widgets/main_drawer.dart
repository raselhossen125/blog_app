// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:blog_app/route/my_app_routes.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawer extends StatelessWidget {
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
                    child: Image.asset(
                      'images/image5.jpg',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      'Cristiano Ronaldo',
                      style: smallBoldW,
                    ),
                  ),
                  Text(
                    'ronaldo914157@gmail.com',
                    style: smallBoldW,
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(MyAppRoutes.profileageRoute);
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
              onTap: () {},
              leading: Icon(
                Icons.home,
                color: iconColor,
              ),
              title: Text(
                'My Blog',
                style: smallBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
