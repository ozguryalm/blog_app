
import 'package:get/get.dart';
import '../controllers/blog_detail_controller.dart';


class BlogDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogDetailController>(() => BlogDetailController());
        // Get.put<BlogDetailController>(BlogDetailController());
  }
}