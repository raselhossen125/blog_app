// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../db/db_helper.dart';
import '../models/user_model.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static User? get user => _auth.currentUser;

  static Future<bool> logIn(String email, String password) async {
    final credensial = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return credensial != null;
  }

  static Future<void> register(
      String name, String email, String password) async {
    final credensial = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final userModel = UserModel(
      uId: credensial.user!.uid,
      name: name,
      email: email,
      userCreationTime:
          Timestamp.fromDate(credensial.user!.metadata.creationTime!),
    );
    AuthService.user!.updateDisplayName(name);
    return DBHelper.addUser(userModel);
  }

  static updateDisplayName(String newName) {
    AuthService.user!.updateDisplayName(newName);
  }

  static updateEmail(String newEmail) async{
    AuthService.user!.updateEmail(newEmail);
  }

  static updateProfilePic(String newprofilePic) {
    AuthService.user!.updatePhotoURL(newprofilePic);
  }

  static Future<void> logOut() => _auth.signOut();
}
