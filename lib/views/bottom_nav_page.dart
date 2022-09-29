// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:blog_app/auth/auth_service.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/views/blog_page.dart';
import 'package:blog_app/views/profile_page.dart';
import 'package:flutter/material.dart';

class ShowBottomNavScreen extends StatefulWidget {
  @override
  State<ShowBottomNavScreen> createState() => _ShowBottomNavScreenState();
}

class _ShowBottomNavScreenState extends State<ShowBottomNavScreen> {
  int index = 0;
  final screens = [
    BlogPage(),
    Center(child: Text("Applicatons")),
    Center(child: Text("Search")),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: btnColor,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        child: NavigationBar(
          height: 65,
          backgroundColor: appColor,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "Home"),
            NavigationDestination(
                icon: Icon(
                  Icons.air,
                  color: Colors.white,
                ),
                label: "Applications"),
            NavigationDestination(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: "Search"),
            NavigationDestination(
              icon: Container(
                height: 22,
                width: 22,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: AuthService.user!.photoURL != null
                      ? Image.network(AuthService.user!.photoURL!)
                      : Image.asset('images/R.png'),
                ),
              ),
              label: 'Me',
            )
          ],
        ),
      ),
    );
  }
}
