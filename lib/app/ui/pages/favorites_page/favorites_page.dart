import '../../../routes/app_routes.dart';
import '../../../controllers/blog_controller.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/favorites_controller.dart';

class FavoritesPage extends GetView<FavoritesController> {
  FavoritesPage({Key? key}) : super(key: key);
  BlogController blogController = Get.find<BlogController>();

  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
        title: "Favorites",
        child: CustomScrollView(
          slivers: [
            SliverPadding(
                padding: const EdgeInsets.only(top: 16.0),
                sliver: Obx(() {
                  return blogController
                              .accountmodel.value.data!.favoriteBlogIds ==
                          null
                      ? const SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return buildGridItem(
                                index,
                                context,
                                blogController.accountmodel.value.data!
                                    .favoriteBlogIds![index]);
                          },
                              childCount: blogController.accountmodel.value
                                  .data!.favoriteBlogIds!.length),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 31.50.h,
                            crossAxisCount: 2,
                            mainAxisSpacing: 16.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 1.0,
                          ));
                })),
          ],
        ));
  }

  Color setColor(id) {
    // var result = blogController.accountmodel.value.data!.favoriteBlogIds!
    //     .where((element) => id == element);
    // if (result.isEmpty) {
    //   return Colors.grey;
    // } else {
    //   return Colors.pink;
    // }
    return Colors.pink;
  }

  buildGridItem(int index, BuildContext context, String id) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.BLOG_DETAIL,
          arguments: blogController.favoriteBlogs.value.data![index]),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        child: Container(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.network(
                          blogController
                              .favoriteBlogs.value.data![index].image!,
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          blogController
                              .favoriteBlogs.value.data![index].title!,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ))
                ],
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Obx(() {
                    return IconButton(
                      onPressed: () async {
                        await controller.addFavorite(id);
                        await blogController.filterFavorite();
                      },
                      icon: Icon(Icons.favorite,
                          color: setColor(
                              blogController.blogs.value.data![index].id)),
                      iconSize: 27.sp,
                    );
                  }))
            ],
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
