// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:blog_app/route/my_app_routes.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/style.dart';
import 'package:blog_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../widgets/blog_item.dart';

class BlogPage extends StatefulWidget {
  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Blog'),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            setState(() {
              isVisible = true;
            });
          } else if (notification.direction == ScrollDirection.reverse) {
            setState(() {
              isVisible = false;
            });
          }
          return true;
        },
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return BlogItem();
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: isVisible,
        child: SizedBox(
          height: 55,
          child: FloatingActionButton.extended(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: btnColor,
            onPressed: () {
              Get.toNamed(MyAppRoutes.addBlogPageRoute);
            },
            icon: Icon(Icons.add),
            label: Text(
              'Add blog',
              style: smallNormalW,
            ),
          ),
        ),
      ),
    );
  }
}
