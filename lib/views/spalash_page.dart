// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, depend_on_referenced_packages

import 'dart:async';
import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../route/my_app_routes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SpalashPage extends StatefulWidget {
  @override
  State<SpalashPage> createState() => _SpalashPageState();
}

class _SpalashPageState extends State<SpalashPage> {
  late StreamSubscription subscription;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() async {
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        // Got a new connectivity status!
        if (result == ConnectivityResult.mobile) {
          showSnakbar('Connected to mobile network', 1500, Colors.purple);
          navigator(1);
        } else if (result == ConnectivityResult.wifi) {
          navigator(1);
        } else {
          showSnakbar('Connected to wifi network', 1500, Colors.green);
        }
      },
    );
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      navigator(3);
    } else {
      showSnakbar('No internet connection', 2000, Colors.red);
    }
  }

  void showSnakbar(String message, int duration, Color bgColor) {
    Get.snackbar('Message', message,
        backgroundColor: bgColor,
        colorText: Colors.black,
        duration: Duration(milliseconds: duration));
  }

  void navigator(int duration) {
    Future.delayed(Duration(seconds: duration), () {
      Get.offNamed(MyAppRoutes.launcherPageRoute);
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Shimmer(
        duration: Duration(seconds: 2),
        interval: Duration(seconds: 2),
        color: Colors.grey,
        colorOpacity: 0.1,
        enabled: true,
        direction: ShimmerDirection.fromLTRB(),
        child: Center(
          child: Text('Blog',
              style: GoogleFonts.lobster(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 28,
                ),
              )),
        ),
      ),
    );
  }
}
