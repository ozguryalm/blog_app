import 'package:blog/app/controllers/blog_controller.dart';
import 'package:blog/app/controllers/main_controller.dart';
import 'package:blog/app/data/models/blog_model.dart';
import 'package:blog/app/data/models/categories_model.dart';
import 'package:blog/app/data/services/blog_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<CategoriesModel> categories = CategoriesModel().obs;
  

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
    
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
