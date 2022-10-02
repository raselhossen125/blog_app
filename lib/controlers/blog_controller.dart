// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print, curly_braces_in_flow_control_structures, unused_local_variable, await_only_futures

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
  var isLoading = false.obs;
  BlogModel? selectedBlog;

  @override
  void onInit() {
    getAllBlogs();
    super.onInit();
  }

  Future<void> addBlog(BlogModel blogModel) =>
      DBHelper.addBlog(blogModel, AuthService.user!.uid);

  getAllBlogs(){
    isLoading(true);
    DBHelper.getAllBlogs().listen((snapshort) {
      bloagList = List.generate(snapshort.docs.length,
          (index) => BlogModel.fromMap(snapshort.docs[index].data()));
    });
    isLoading(false);
    update();
  }

  getBlogByUserId(String uid) {
    bloagListByUid.clear();
    bloagList.map((item) {
      if (item.userId == uid) {
        bloagListByUid.add(item);
      }
    }).toList();
  }

  updateBlog(String blogId, Map<String, dynamic> map) {
    DBHelper.updateBlog(blogId, map);
  }

  Future<void> deleteBlog(String blogId) {
    return DBHelper.deleteBlog(blogId, AuthService.user!.uid);
  }

  deleteBlogByBlogId(String blogId) {
    bloagListByUid.removeWhere((element) => element.blogId == blogId);
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
