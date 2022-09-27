// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../route/my_app_routes.dart';

class SpalashPage extends StatefulWidget {
  @override
  State<SpalashPage> createState() => _SpalashPageState();
}

class _SpalashPageState extends State<SpalashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(MyAppRoutes.launcherPageRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Blog', style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 28,
        ),),
      ),
    );
  }
}