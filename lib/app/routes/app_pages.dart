import '../bindings/blog_detail_binding.dart';
import '../ui/pages/blog_detail_page/blog_detail_page.dart';
      import '../bindings/profile_binding.dart';
import '../ui/pages/profile_page/profile_page.dart';
      import '../bindings/favorites_binding.dart';
import '../ui/pages/favorites_page/favorites_page.dart';
      import '../bindings/main_binding.dart';
import '../ui/pages/main_page/main_page.dart';
      import '../bindings/register_binding.dart';
import '../ui/pages/register_page/register_page.dart';
import '../bindings/login_binding.dart';
import '../ui/pages/login_page/login_page.dart';
import 'package:get/get.dart';

import '../bindings/home_binding.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/unknown_route_page/unknown_route_page.dart';
import 'app_routes.dart';

const _defaultTransition = Transition.cupertino;

class AppPages {
  static final unknownRoutePage = GetPage(
    name: AppRoutes.UNKNOWN,
    page: () => const UnknownRoutePage(),
    transition: _defaultTransition,
  );

  static final List<GetPage> pages = [
    unknownRoutePage,
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () =>const RegisterPage(),
      binding: RegisterBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.FAVORITES,
      page: () => FavoritesPage(),
      binding: FavoritesBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.BLOG_DETAIL,
      page: () => BlogDetailPage(),
      binding: BlogDetailBinding(),
      transition: _defaultTransition,
    ), 
];
}