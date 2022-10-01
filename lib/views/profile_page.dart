// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_null_comparison, prefer_if_null_operators, unused_local_variable, unused_label, use_build_context_synchronously, unused_element, unnecessary_string_interpolations

import 'package:blog_app/auth/auth_service.dart';
import 'package:blog_app/controlers/blog_controller.dart';
import 'package:blog_app/controlers/user_controler.dart';
import 'package:blog_app/utils/colors.dart';
import 'package:blog_app/utils/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../auth/auth_service.dart';
import '../models/user_model.dart';
import '../widgets/profile_blog_item.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController =
      TextEditingController(text: AuthService.user!.displayName);
  String? imageUrl;
  bool isGalary = true;
  bool isVisible = false;
  bool isProfile = false;

  @override
  Widget build(BuildContext context) {
    Get.find<BlogController>().getBlogByUserId(AuthService.user!.uid);
    return Scaffold(
      backgroundColor: bgColor,
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: Get.find<UserControler>().getUserByUid(AuthService.user!.uid),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              final userM = UserModel.fromMap(snapshot.data.data());
              return NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      floating: true,
                      snap: true,
                      title: Text(
                        userM.name != null ? userM.name : " Not available",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      actions: [
                        if (isVisible)
                          IconButton(
                            onPressed: () {
                              if (imageUrl != null) {
                                isProfile
                                    ? Get.find<UserControler>().updateProfile(
                                        {'$UserProfileImage': '$imageUrl'},
                                      )
                                    : Get.find<UserControler>().updateProfile(
                                        {'$UserCoverImage': '$imageUrl'},
                                      );
                                EasyLoading.dismiss();
                                setState(() {
                                  isVisible = false;
                                  imageUrl = '';
                                });
                              }
                            },
                            icon: Icon(
                              Icons.check_outlined,
                            ),
                          )
                      ],
                    )
                  ];
                },
                body: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                          ),
                          child: userM.coverImage == null
                              ? Image.asset(
                                  'images/image3.jpg',
                                  height: 230,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  userM.coverImage!,
                                  height: 230,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Positioned(
                          top: 15,
                          right: 15,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: appColor.withOpacity(0.6)),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isProfile = false;
                                });
                                choseImageSheat();
                              },
                              icon: Icon(
                                Icons.edit,
                                color: bgColor,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 145,
                          left: 20,
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 147,
                                width: 147,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.4),
                                    shape: BoxShape.circle),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: userM.profileImage == null
                                    ? Image.asset(
                                        'images/R.png',
                                        height: 140,
                                        width: 140,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        userM.profileImage!,
                                        height: 140,
                                        width: 140,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              Positioned(
                                left: 120,
                                bottom: 90,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: appColor.withOpacity(0.6)),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isProfile = true;
                                      });
                                      choseImageSheat();
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: bgColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 58, left: 50),
                      child: Row(
                        children: [
                          Text(
                            userM.name != null ? userM.name : 'Not Available',
                            style: largeBold,
                          ),
                          IconButton(
                            onPressed: () {
                              showEditDialog(
                                Icons.person,
                                'Enter your name',
                              );
                            },
                            icon: Icon(
                              Icons.edit,
                              color: iconColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, bottom: 10, left: 10),
                      child: Text(
                        'My Blog',
                        style: mediamBold,
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.all(0),
                      primary: false,
                      shrinkWrap: true,
                      itemCount:
                          Get.find<BlogController>().bloagListByUid.length,
                      itemBuilder: (context, index) {
                        final blogM =
                            Get.find<BlogController>().bloagListByUid[index];
                        return ProfileBlogItem(blogModel: blogM);
                      },
                    )
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Failed to load data'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  void choseImageSheat() {
    Get.bottomSheet(
      Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 8),
            Container(
              height: 5,
              width: 60,
              color: Colors.grey.withOpacity(0.2),
            ),
            SizedBox(height: 40),
            TextButton.icon(
              onPressed: () {
                isGalary = false;
                _getImage();
              },
              icon: Icon(
                Icons.camera,
                color: iconColor,
              ),
              label: Text(
                'Chose From Camera',
                style: mediamNormal,
              ),
            ),
            TextButton.icon(
              onPressed: () {
                isGalary = true;
                _getImage();
              },
              icon: Icon(
                Icons.image,
                color: iconColor,
              ),
              label: Text(
                'Chose From Galery',
                style: mediamNormal,
              ),
            ),
          ],
        ),
      ),
      barrierColor: appColor.withOpacity(0.5),
    );
  }

  void showEditDialog(IconData prefixIcon, String hintText) {
    Get.defaultDialog(
      title: 'Edit Name',
      content: TextFormField(
        controller: nameController,
        cursorColor: appColor,
        style: TextStyle(color: appColor, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
          contentPadding: EdgeInsets.only(left: 10),
          focusColor: Colors.grey.withOpacity(0.1),
          prefixIcon: Icon(
            prefixIcon,
            color: iconColor,
          ),
          hintText: hintText,
          hintStyle:
              TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel')),
        TextButton(
          onPressed: () {
            Get.find<UserControler>()
                .updateProfile({UserName: nameController.text});
            AuthService.updateDisplayName(nameController.text);
            Get.back();
          },
          child: Text('Save'),
        ),
      ],
    );
  }

  void _getImage() async {
    final status = isGalary;
    final selectedImage = await ImagePicker()
        .pickImage(source: isGalary ? ImageSource.gallery : ImageSource.camera);
    if (selectedImage != null) {
      try {
        Navigator.of(context).pop();
        EasyLoading.show(status: 'Please wait');
        final url = await Get.find<BlogController>().updateImage(selectedImage);
        setState(() {
          imageUrl = url;
        });
        EasyLoading.dismiss();
        setState(() {
          isVisible = true;
        });
      } catch (e) {
        EasyLoading.dismiss();
        Get.snackbar('Error', e.toString());
      }
    }
  }
}
