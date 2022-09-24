// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'route/my_app_pages.dart';
import 'views/spalash_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xff006666),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, Color> pokeballRedSwatch = {
      50: Color.fromARGB(255, 24, 1, 105),
      100: Color.fromARGB(255, 255, 88, 88),
      200: Color.fromARGB(255, 255, 88, 88),
      300: Color.fromARGB(255, 255, 88, 88),
      400: Color.fromARGB(255, 255, 88, 88),
      500: Color.fromARGB(255, 255, 88, 88),
      600: Color.fromARGB(255, 255, 88, 88),
      700: Color.fromARGB(255, 255, 88, 88),
      800: Color.fromARGB(255, 255, 88, 88),
      900: Color.fromARGB(255, 252, 70, 70),
    };
    MaterialColor pokeballRed = MaterialColor(0xff006666, pokeballRedSwatch);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: MyAppPages.pages,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: pokeballRed,
      ),
      home: SpalashPage(),
    );
  }
}