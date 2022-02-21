import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/account_model.dart';
import '../data/models/blog_model.dart';
import '../data/services/account_service.dart';
import '../data/services/blog_service.dart';

class BlogController extends GetxController {
  Rx<BlogsModel> blogs = BlogsModel().obs;
  Rx<BlogsModel> favoriteBlogs = BlogsModel(data: []).obs;
  Rx<AccountModel> accountmodel = AccountModel().obs;

  filterFavorite() {
    for (var item in blogs.value.data!) {
      if (accountmodel.value.data!.favoriteBlogIds!.contains(item.id)) {
       
          favoriteBlogs.value.data!.add(item);
        
      } else {}
    }
  }

  Future getBlogs({String? categoryId}) async {
    return await BlogService().getBlogs(categoryId: categoryId).then((value) {
      if (value == false) {
        debugPrint(value);
      } else {
        blogs.value = value;
      }
    });
  }

  Future getBadgesCount() async {
    return await AccountService().getAccount().then((value) {
      if (value == false) {
      } else {
        return accountmodel.value = value;
      }
    });
  }

  Future<dynamic> initfuncs() async {
    await getBlogs();
    await getBadgesCount().then((value) {
      filterFavorite();
      return value;
    });
  }

  @override
  void onInit() {
    initfuncs();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
