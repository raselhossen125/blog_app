// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, must_be_immutable, unnecessary_null_comparison, prefer_if_null_operators, unused_local_variable

import 'package:blog_app/controlers/user_controler.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/utils/helper_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../utils/style.dart';

class BlogItem extends StatelessWidget {
  BlogModel blogModel;

  BlogItem({
    required this.blogModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: Get.find<UserControler>().getUserByUid(blogModel.blogId!),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          final userM = UserModel.fromMap(snapshot.data.data());
                          return Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: userM.profileImage != null
                                      ? Image.network(userM.profileImage!)
                                      : Image.asset('images/R.png'),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  userM.name != null
                                      ? userM.name
                                      : 'Not Available',
                                  style: smallBold,
                                ),
                              )
                            ],
                          );
                        }
                        if (snapshot.hasError) {
                          return Text('Failed to face data');
                        }
                        return CircularProgressIndicator();
                      }),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getFormatedDateTime(
                              blogModel.blogCreationTime.toDate(),
                              'MMM dd yyy'),
                          style: smallNormal,
                        ),
                        Text(
                          getFormatedDateTime(
                              blogModel.blogCreationTime.toDate(), 'hh : mm a'),
                          style: smallNormal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 600,
                minHeight: 250,
                maxWidth: double.infinity,
                minWidth: double.infinity,
              ),
              child: ClipRRect(
                child: Image.network(
                  blogModel.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          blogModel.title,
                          style: mediamBold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        blogModel.category,
                        style: smallBold,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      blogModel.descripton,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
