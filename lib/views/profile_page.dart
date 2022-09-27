// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:blog_app/route/my_app_routes.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/profile_blog_item.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              title: Text(
                'Cristiano Ronaldo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ];
        },
        body: ListView(
          padding: EdgeInsets.all(0),
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
                  top: 145,
                  left: 20,
                  child: Stack(
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
                        child: Image.asset(
                          'images/image5.jpg',
                          height: 140,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              alignment: Alignment.centerRight,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(MyAppRoutes.editProfilePageRoute);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Edit profile',
                        style: mediamBold,
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.edit),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 72, left: 40),
              child: Text(
                'Cristiano Ronaldo',
                style: largeBold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10, left: 10),
              child: Text(
                'My Blog',
                style: mediamBold,
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ProfileBlogItem();
              },
            ),
          ],
        ),
      ),
    );
  }
}
