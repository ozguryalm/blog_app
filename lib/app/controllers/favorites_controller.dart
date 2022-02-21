import 'package:blog/app/controllers/blog_controller.dart';
import 'package:blog/app/controllers/home_controller.dart';
import 'package:blog/app/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../data/services/blog_service.dart';

class FavoritesController extends GetxController {
  BlogController blogController = Get.find<BlogController>();
  addFavorite(String blogId) async {
    await BlogService().addFavorite(blogId);
    await blogController.getBadgesCount();
  }

  

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    blogController.favoriteBlogs.value.data!.clear();
    super.onClose();
  }
}
