import 'blog_controller.dart';
import 'package:get/get.dart';

import '../data/services/blog_service.dart';

class FavoritesController extends GetxController {
  BlogController blogController = Get.find<BlogController>();
  addFavorite(String blogId) async {
    await BlogService().addFavorite(blogId);
    await blogController.getBadgesCount().then((value) {

      blogController.filterFavorite(favoritelist: value.data.favoriteBlogIds);
      return value;
    });
  }

  @override
  void onInit() {
    blogController.filterFavorite();
    blogController.getBadgesCount();
    super.onInit();
  }

}
