// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  IconData? prefixIcon;
  TextInputType? keyBordType;
  int? maxLine;

  MyTextField({
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.keyBordType,
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      keyboardType: keyBordType,
      controller: controller,
      cursorColor: appColor,
      style: TextStyle(color: appColor, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        contentPadding: EdgeInsets.only(left: 10),
        focusColor: Colors.grey.withOpacity(0.1),
        prefixIcon: Icon(
          prefixIcon,
          color: iconColor,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
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
    );
  }
}
