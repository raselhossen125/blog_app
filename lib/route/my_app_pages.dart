import 'package:blog_app/views/add_blog_page.dart';
import 'package:blog_app/views/bottom_nav_page.dart';
import 'package:blog_app/views/edit_profile_page.dart';
import 'package:blog_app/views/launcher_page.dart';
import 'package:get/get.dart';
import '../views/auth/login_page.dart';
import '../views/auth/register_page.dart';
import '../views/blog_page.dart';
import '../views/profile_page.dart';
import '../views/spalash_page.dart';
import 'my_app_routes.dart';

class MyAppPages {
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
    ),
    GetPage(
      name: MyAppRoutes.blogPageRoute,
      page: () => BlogPage(),
    ),
    GetPage(
      name: MyAppRoutes.addBlogPageRoute,
      page: () => AddBlogpage(),
    ),
    GetPage(
      name: MyAppRoutes.profilePageRoute,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: MyAppRoutes.editProfilePageRoute,
      page: () => EditProfilePage(),
    ),
  ];
}
