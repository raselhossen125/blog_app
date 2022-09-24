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
      name: MyAppRoutes.logInPageRoute,
      page: () => LogInPage(),
    ),
    GetPage(
      name: MyAppRoutes.registerPageRoute,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: MyAppRoutes.blogPageRoute,
      page: () => BlogPage(),
    ),
    GetPage(
      name: MyAppRoutes.profileageRoute,
      page: () => ProfilePage(),
    ),
  ];
}
