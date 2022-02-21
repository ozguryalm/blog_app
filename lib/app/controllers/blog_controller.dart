import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../data/models/account_model.dart';
import '../data/models/blog_model.dart';
import '../data/services/account_service.dart';
import '../data/services/blog_service.dart';

class BlogController extends GetxController {
  Rx<BlogsModel> blogs = BlogsModel().obs;
  Rx<AccountModel> accountmodel = AccountModel().obs;
  Rx<BlogsModel> categorizedBLogs = BlogsModel().obs;
  Rx<BlogsModel> favoriteBlogs = BlogsModel(data: <Datum>[]).obs;
  final box = GetStorage();

  Future getBlogs({String? categoryId}) async {
    return await BlogService().getBlogs(categoryId: categoryId).then((value) {
      if (value == false) {
        debugPrint(value);
      } else {
        if (categoryId != null) {
          categorizedBLogs.value = value;
        } else {
          blogs.value = value;
        }
      }
    });
  }

  filterFavorite({List<String>? favoritelist})async {
   await getBadgesCount();
    if (favoritelist == null) {
      for (var i = 0;
          i < accountmodel.value.data!.favoriteBlogIds!.length;
          i++) {
        favoriteBlogs.value.data!.add(blogs.value.data!.firstWhere((element) =>
            element.id == accountmodel.value.data!.favoriteBlogIds![i]));
      }
    } else {
      for (var i = 0; i < favoritelist.length; i++) {
        favoriteBlogs.value.data!.add(blogs.value.data!
            .firstWhere((element) => element.id == favoritelist[i]));
      }
    }
  }

  Future getBadgesCount() async {
    return await AccountService().getAccount().then((value) {
      if (value == false) {
      } else {
        accountmodel.value = value;
        return value;
      }
    });
  }

  Future<dynamic> initfuncs() async {
    await getBlogs();
    await getBadgesCount().then((value) {
      return value;
    });
  }

  @override
  void onInit() {
    initfuncs();
    super.onInit();
  }
}
