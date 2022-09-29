// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_null_comparison, prefer_if_null_operators, unused_local_variable

import 'package:blog_app/auth/auth_service.dart';
import 'package:blog_app/controlers/blog_controller.dart';
import 'package:blog_app/controlers/user_controler.dart';
import 'package:blog_app/route/my_app_routes.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/auth_service.dart';
import '../models/user_model.dart';
import '../widgets/profile_blog_item.dart';

class ProfilePage extends StatelessWidget {
  final userController = Get.put(UserControler());
  final blogController = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    blogController.getBlogByUserId(AuthService.user!.uid);
    return Scaffold(
      backgroundColor: bgColor,
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: userController.getUserByUid(AuthService.user!.uid),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              final userM = UserModel.fromMap(snapshot.data.data());
              return NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      floating: true,
                      snap: true,
                      title: Text(
                        userM.name != null ? userM.name : " Not available",
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
                            )),
                        Positioned(
                          top: 145,
                          left: 20,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 147,
                                width: 147,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    shape: BoxShape.circle),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: userM.profileImage == null
                                    ? Image.asset(
                                        'images/R.png',
                                        height: 140,
                                        width: 140,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        userM.profileImage!,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          alignment: Alignment.centerRight,
                          height: 42,
                          width: 145,
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
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 50),
                      child: Text(
                        userM.name != null ? userM.name : 'Not Available',
                        style: largeBold,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, bottom: 10, left: 10),
                      child: Text(
                        'My Blog',
                        style: mediamBold,
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.all(0),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: blogController.bloagListByUid.length,
                      itemBuilder: (context, index) {
                        final blogM = blogController.bloagListByUid[index];
                        return ProfileBlogItem(blogModel: blogM);
                      },
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Failed to load data'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
