// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print, curly_braces_in_flow_control_structures, unused_local_variable

import 'dart:io';
import 'package:blog_app/auth/auth_service.dart';
import 'package:blog_app/db/db_helper.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BlogController extends GetxController {
  List<BlogModel> bloagList = [];
  List<BlogModel> bloagListByUid = [];

  @override
  void onInit() {
    getAllBlogs();
    super.onInit();
  }

  Future<void> addBlog(BlogModel blogModel) =>
      DBHelper.addBlog(blogModel, AuthService.user!.uid);

  getAllBlogs() {
    DBHelper.getAllBlogs().listen((snapshort) {
      bloagList = List.generate(snapshort.docs.length,
          (index) => BlogModel.fromMap(snapshort.docs[index].data()));
    });
  }

  getBlogByUserId(String uid) {
    print(bloagList.length);
    print('suru');
    bloagList.map((item) {
      if (item.blogId == uid) {
        bloagListByUid.add(item);
      }
    }).toList();
    print(bloagListByUid.length);
  }

  Future<String> updateImage(XFile xFile) async {
    final imagename = DateTime.now().millisecondsSinceEpoch.toString();
    final photoRefarance =
        FirebaseStorage.instance.ref().child('blogPictures/$imagename');
    final uploadtask = photoRefarance.putFile(File(xFile.path));
    final snapshort = await uploadtask.whenComplete(() => null);
    return snapshort.ref.getDownloadURL();
  }
}
