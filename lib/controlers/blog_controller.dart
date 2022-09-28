import 'dart:io';
import 'package:blog_app/auth/auth_service.dart';
import 'package:blog_app/db/db_helper.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

class BlogController extends GetxController {
  List<BlogModel> bloagList = [];

  @override
  void onInit() {
    getAllBlogs();
    super.onInit();
  }

  Future<void> addBlog(BlogModel blogModel) => DBHelper.addBlog(blogModel, AuthService.user!.uid);

  getAllBlogs() {
    DBHelper.getAllBlogs().listen((snapshort) {
      bloagList = List.generate(snapshort.docs.length,
          (index) => BlogModel.fromMap(snapshort.docs[index].data()));
    });
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
