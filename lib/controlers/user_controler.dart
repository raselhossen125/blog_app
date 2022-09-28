// ignore_for_file: override_on_non_overriding_member

import 'package:blog_app/db/db_helper.dart';
import 'package:blog_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserControler {
  Future<void> addUser(UserModel userModel) =>
      DBHelper.addUser(userModel);

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserByUid(String uid) =>
      DBHelper.getUserByUid(uid);
}
