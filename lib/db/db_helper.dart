// ignore_for_file: unnecessary_string_interpolations, non_constant_identifier_names

import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBHelper {
  static const usersCollection = 'Users';
  static const blogsCollection = 'Blogs';

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addUser(UserModel userModel) {
    return _db
        .collection(usersCollection)
        .doc(userModel.uId)
        .set(userModel.toMap());
  }

  static Future<void> addBlog(BlogModel blogModel, uid) {
    final doc = _db.collection(blogsCollection).doc();
    blogModel.blogId = doc.id;
    blogModel.userId = uid;
    return doc.set(blogModel.toMap());
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserByUid(
      String uid) {
    return _db.collection(usersCollection).doc(uid).snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllBlogs() {
    return _db.collection(blogsCollection).orderBy('$BlogCreationTime', descending: true).snapshots();
  }

  static Future<void> updateProfile(String uid, Map<String, dynamic> map) {
    return _db.collection(usersCollection).doc(uid).update(map);
  }

  static Future<void> updateBlog(String blogId, Map<String, dynamic> map) {
    return _db.collection(blogsCollection).doc(blogId).update(map);
  }

  static Future<void> deleteBlog(String blogId, String uid) {
    return _db.collection(blogsCollection).doc(blogId).delete();
  }
}
