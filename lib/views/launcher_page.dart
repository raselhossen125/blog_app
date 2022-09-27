// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:blog_app/route/my_app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/auth_service.dart';

class LauncherPage extends StatefulWidget {
  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      if (AuthService.user == null) {
        Get.offAllNamed(MyAppRoutes.logInPageRoute);
      } else {
        Get.offAllNamed(MyAppRoutes.bottomNavPageRoute);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
