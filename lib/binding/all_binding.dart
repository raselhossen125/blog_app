import 'package:blog_app/controlers/blog_controller.dart';
import 'package:blog_app/controlers/user_controler.dart';
import 'package:get/get.dart';

class AllBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserControler>(UserControler());
    Get.put<BlogController>(BlogController());
  }

}