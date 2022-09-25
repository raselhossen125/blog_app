// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';
import '../utils/style.dart';

class BlogItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset('images/R.png'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Cristiano Ronaldo',
                        style: smallBold,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
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
