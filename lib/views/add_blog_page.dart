// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, sized_box_for_whitespace, unnecessary_null_comparison, unnecessary_this

import 'package:blog_app/route/my_app_routes.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/widgets/my_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/style.dart';

class AddBlogpage extends StatefulWidget {
  @override
  State<AddBlogpage> createState() => _AddBlogpageState();
}

class _AddBlogpageState extends State<AddBlogpage> {
  late Size size;
  final titleController = TextEditingController();
  final descriptonController = TextEditingController();
  final items = ['Sports', 'Movie', 'Game', 'Natok', 'Country'];
  String? dwValue;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              title: Text(
                'New Blog',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                child: Image.asset(
                  'images/image1.jpg',
                  height: 250,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      height: 200,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 8),
                          Container(
                            height: 5,
                            width: 60,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          SizedBox(height: 40),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera,
                              color: iconColor,
                            ),
                            label: Text(
                              'Chose From Camera',
                              style: mediamBold,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.image,
                              color: iconColor,
                            ),
                            label: Text(
                              'Chose From Galery',
                              style: mediamBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    barrierColor: appColor.withOpacity(0.5),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: btnColor,
                  ),
                  child: Text(
                    'Chose Image',
                    style: mediamBoldW,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor, width: 3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text(
                            'Select Category',
                            style: smallBold,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: iconColor,
                          ),
                          isExpanded: true,
                          value: dwValue,
                          items: items
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: smallBold,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              dwValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    MyTextField(
                      controller: titleController,
                      hintText: 'Enter the blog title',
                      prefixIcon: Icons.circle,
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      textAlign: TextAlign.justify,
                      maxLines: 20,
                      controller: descriptonController,
                      cursorColor: appColor,
                      style: TextStyle(
                          color: appColor, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.1),
                        contentPadding: EdgeInsets.only(left: 10),
                        focusColor: Colors.grey.withOpacity(0.1),
                        hintText: 'Enter the blog descripton',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field must not be empty';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              InkWell(
                onTap: _onUploadBlog,
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: btnColor,
                  ),
                  child: Text(
                    'Upload',
                    style: btnStyle,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void _onUploadBlog() {
    if (dwValue == null) {
      Get.snackbar(
        'Error',
        'Please chose the blog category',
        colorText: Colors.white,
      );
      return;
    }
    if (titleController == null || titleController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter the blog title',
        colorText: Colors.white,
      );
      return;
    }
    if (descriptonController == null || descriptonController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter the blog descripton',
        colorText: Colors.white,
      );
      return;
    }
    Get.offAllNamed(MyAppRoutes.bottomNavPageRoute);
  }
}
