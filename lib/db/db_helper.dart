import 'package:blog_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBHelper {
  static const usersCollection = 'Users';

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addUser(UserModel userModel) {
    return _db.collection(usersCollection).doc(userModel.uId).set(userModel.toMap());
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserByUid(String uid) {
    return _db.collection(usersCollection).doc(uid).snapshots();
  }
}
