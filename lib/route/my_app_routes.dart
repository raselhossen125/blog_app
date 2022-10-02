import 'package:blog_app/binding/all_binding.dart';
import 'package:get/get.dart';
import '../controlers/blog_controller.dart';
import '../views/add_blog_page.dart';
import '../views/auth/login_page.dart';
import '../views/auth/register_page.dart';
import '../views/blog_page.dart';
import '../views/bottom_nav_page.dart';
import '../views/launcher_page.dart';
import '../views/profile_page.dart';
import '../views/spalash_page.dart';

class MyAppRoutes {
  static const spalashPageRoute = '/spalash-page';
  static const launcherPageRoute = '/launcher-page';
  static const logInPageRoute = '/logIn-page';
  static const registerPageRoute = '/register-page';
  static const bottomNavPageRoute = '/bottom-nav-page';
  static const blogPageRoute = '/blog-page';
  static const profilePageRoute = '/profile-page';
  static const addBlogPageRoute = '/add-blog-page';

  static final List<GetPage> pages = [
    GetPage(
      name: MyAppRoutes.spalashPageRoute,
      page: () => SpalashPage(),
    ),
    GetPage(
      name: MyAppRoutes.launcherPageRoute,
      page: () => LauncherPage(),
    ),
    GetPage(
      name: MyAppRoutes.logInPageRoute,
      page: () => LogInPage(),
    ),
    GetPage(
      name: MyAppRoutes.registerPageRoute,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: MyAppRoutes.bottomNavPageRoute,
      page: () => ShowBottomNavScreen(),
      binding: AllBinding(),
    ),
    GetPage(
      name: MyAppRoutes.blogPageRoute,
      page: () => BlogPage(),
    ),
    GetPage(
      name: MyAppRoutes.addBlogPageRoute,
      page: () => AddBlogpage( blogModel: Get.find<BlogController>().selectedBlog!),
    ),
    GetPage(
      name: MyAppRoutes.profilePageRoute,
      page: () => ProfilePage(),
  
    ),
  ];
}
