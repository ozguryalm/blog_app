import 'package:badges/badges.dart';
import 'package:blog/app/controllers/blog_controller.dart';
import 'package:blog/app/routes/app_routes.dart';
import 'package:getxbottombar/getxbottombar.dart';

import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main_controller.dart';

class MainPage extends GetView<MainController> {
   MainPage({Key? key}) : super(key: key);
  BlogController blogcontroller = Get.find<BlogController>();
  @override
  Widget build(BuildContext context) {
    return GetxBottomBarView(
      showActiveBackgroundColor: false,
      getPages: AppPages.pages,
      routes: const [AppRoutes.HOME, AppRoutes.FAVORITES, AppRoutes.PROFILE],
      bottomBar: [
        GetBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text(""),
            darkActiveColor: Colors.white,
            inactiveColor: Colors.grey,
            activeColor: Colors.black),
        GetBottomBarItem(
            icon: Obx(() {
              return Badge(
                  badgeContent: blogcontroller.accountmodel.value.data == null
                      ? null
                      : Text(blogcontroller
                          .accountmodel.value.data!.favoriteBlogIds!.length
                          .toString()),
                  child: const Icon(Icons.favorite));
            }),
            title: const Text(""),
            inactiveColor: Colors.grey,
            darkActiveColor: Colors.white,
            activeColor: Colors.black),
        GetBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text(""),
            inactiveColor: Colors.grey,
            darkActiveColor: Colors.white,
            activeColor: Colors.black),
      ],
    );
  }
}
