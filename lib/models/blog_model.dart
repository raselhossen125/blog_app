// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

const String BlogId = 'blogId';
const String BlogTitle = 'title';
const String BlogCategory = 'category';
const String BlogImage = 'image';
const String BlogDescripton = 'descripton';
const String BlogCreationTime = 'blogCreationTime';

class BlogModel {
  String? blogId;
  String title;
  String category;
  String image;
  String descripton;
  Timestamp blogCreationTime;

  BlogModel({
    this.blogId,
    required this.title,
    required this.category,
    required this.image,
    required this.descripton,
    required this.blogCreationTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      BlogId: blogId,
      BlogTitle: title,
      BlogCategory: category,
      BlogImage: image,
      BlogDescripton: descripton,
      BlogCreationTime: blogCreationTime,
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) => BlogModel(
        blogId: map[BlogId],
        title: map[BlogTitle],
        category: map[BlogCategory],
        image: map[BlogImage],
        descripton: map[BlogDescripton],
        blogCreationTime: map[BlogCreationTime],
      );
}
