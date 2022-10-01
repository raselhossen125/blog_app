// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_null_comparison, avoid_print, sort_child_properties_last

import 'package:blog_app/controlers/blog_controller.dart';
import 'package:blog_app/route/my_app_routes.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/style.dart';
import 'package:blog_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../auth/auth_service.dart';
import '../widgets/blog_item.dart';

class BlogPage extends StatefulWidget {
  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    print(AuthService.user!.displayName);
    print(AuthService.user!.email);
    return Scaffold(
      backgroundColor: bgColor,
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
      body: Visibility(
        visible: Get.find<BlogController>().isLoading.value,
        child: Center(
          child: CircularProgressIndicator(),
        ),
        replacement: NestedScrollView(
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
            child: GetBuilder(
              init: BlogController(),
              builder: (controller) {
                return ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: Get.find<BlogController>().bloagList.length,
                  itemBuilder: (context, index) {
                    final blogM = Get.find<BlogController>().bloagList[index];
                    return BlogItem(
                      blogModel: blogM,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
