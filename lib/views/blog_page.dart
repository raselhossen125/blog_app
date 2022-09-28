// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_null_comparison, avoid_print

import 'package:blog_app/controlers/blog_controller.dart';
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
  final blogController = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isVisible
          ? AnimatedContainer(
              height: 55,
              width: 150,
              duration: Duration(milliseconds: 200),
              child: FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
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
            )
          : AnimatedContainer(
              height: 55,
              width: 55,
              duration: Duration(milliseconds: 200),
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: btnColor,
                onPressed: () {
                  Get.toNamed(MyAppRoutes.addBlogPageRoute);
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
      drawer: MainDrawer(),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              title: Text(
                'Blog',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ];
        },
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
          child: blogController.bloagList != null
              ? ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: blogController.bloagList.length,
                  itemBuilder: (context, index) {
                    final blogM = blogController.bloagList[index];
                    return BlogItem(
                      blogModel: blogM,
                    );
                  },
                )
              : Center(
                  child: Text('No blog found'),
                ),
        ),
      ),
    );
  }
}
