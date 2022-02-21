import 'blog_controller.dart';
import '../data/models/categories_model.dart';
import '../data/services/blog_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<CategoriesModel> categories = CategoriesModel().obs;
  BlogController blogController = Get.find<BlogController>();

  getCategories() async {
    return await BlogService().getCategories().then((value) {
      if (value == false) {
        debugPrint(value.toString());
      } else {
        categories.value = value;
      }
    });
  }

  addFavorite(String blogId) async {
    await BlogService().addFavorite(blogId);
    await Get.find<BlogController>().getBadgesCount();
    blogController.filterFavorite();
  }

  @override
  void onInit() {
    blogController.getBlogs();
    getCategories();
    super.onInit();
  }
}
