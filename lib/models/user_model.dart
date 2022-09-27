// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

const String UserId = 'uId';
const String UserName = 'name';
const String UserEmail = 'email';
const String UserProfileImage = 'profileImage';
const String UserCoverImage = 'coverImage';
const String UserGender = 'gender';
const String UserICreationTime = 'userCreationTime';

class UserModel {
  String? uId;
  String name;
  String email;
  String? profileImage;
  String? coverImage;
  String? gender;
  Timestamp userCreationTime;

  UserModel({
    this.uId,
    required this.name,
    required this.email,
    this.profileImage,
    this.coverImage,
    this.gender,
    required this.userCreationTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UserId: uId,
      UserName: name,
      UserEmail: email,
      UserProfileImage: profileImage,
      UserCoverImage: coverImage,
      UserGender: gender,
      UserICreationTime: userCreationTime,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        uId: map[UserId],
        name: map[UserName],
        email: map[UserEmail],
        profileImage: map[UserProfileImage],
        coverImage: map[UserCoverImage],
        gender: map[UserGender],
        userCreationTime: map[UserICreationTime],
      );
}
