// ignore_for_file: override_on_non_overriding_member

import 'package:blog_app/db/db_helper.dart';
import 'package:blog_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../auth/auth_service.dart';

class UserControler extends GetxController {
  @override
  onReady() {
    super.onReady();
    getTanentId();
  }

  void getTanentId() {
    print('2222222222222222222222222222222222222222222');
    if (AuthService.user != null) {
      print("User not null");
      if (AuthService.user!.tenantId != null) {
        print(AuthService.user!.tenantId);
      } else {
        print("Tanent id null");
      }
    } else {
      print("User null");
    }
  }

  Future<void> addUser(UserModel userModel) => DBHelper.addUser(userModel);

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserByUid(String uid) =>
      DBHelper.getUserByUid(uid);

  updateProfile(Map<String, dynamic> map) {
    DBHelper.updateProfile(AuthService.user!.uid, map);
  }
}
