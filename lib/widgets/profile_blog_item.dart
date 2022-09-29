// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors, sort_child_properties_last

import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';
import '../utils/style.dart';

class ProfileBlogItem extends StatefulWidget {
  @override
  State<ProfileBlogItem> createState() => _ProfileBlogItemState();
}

class _ProfileBlogItemState extends State<ProfileBlogItem> {
  final items = ['Sports', 'Movie', 'Game', 'Natok', 'Country'];
  String? dwValue;

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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 30,
                        width: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset('images/R.png'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            'Cristiano Ronaldo',
                            style: smallBold,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Spacer(),
                      PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text("Edit"),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: Text("Delete"),
                            value: 2,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'April 20, 2022',
                          style: smallNormal,
                        ),
                        Text(
                          '10: 25 am',
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
                child: Image.asset(
                  'images/image2.jpg',
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
                          'Shakib all hasan',
                          style: smallBold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Sports',
                        style: smallBold,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    txt,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
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
