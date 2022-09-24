// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:blog_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/blog_item.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Blog'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return BlogItem();
        },
      ),
    );
  }
}
