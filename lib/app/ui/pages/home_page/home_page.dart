import '../../../controllers/blog_controller.dart';
import '../../../routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../data/models/blog_model.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  BlogController blogController = Get.find<BlogController>();
  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
      leading: IconButton(
          onPressed: () {}, icon: Image.asset("assets/icons/search.png")),
      title: "Home",
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 16, bottom: 3.55.h),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                  height: 13.7.h,
                  child: Obx(() {
                    return controller.categories.value.data == null
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return buildShimmer(context);
                            },
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categories.value.data!.length,
                            itemBuilder: (context, index) {
                              return buildCategoryBox(index, context);
                            },
                          );
                  })),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              "Blog",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SliverPadding(
              padding: const EdgeInsets.only(top: 16.0),
              sliver: Obx(() {
                return blogController.blogs.value.data == null
                    ? const SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : SliverGrid(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return buildGridItem(
                              index,
                              context,
                              controller.blogController.categorizedBLogs.value.data !=
                                      null
                                  ? controller.blogController.categorizedBLogs
                                      .value.data!
                                  : blogController.blogs.value.data!);
                        },
                            childCount: controller.blogController
                                        .categorizedBLogs.value.data !=
                                    null
                                ? controller.blogController.categorizedBLogs
                                    .value.data!.length
                                : blogController.blogs.value.data!.length),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 31.50.h,
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 1.0,
                        ));
              })),
        ],
      ),
    );
  }

  Color setColor(id) {
    if (blogController.accountmodel.value.data == null) {
      return Colors.grey;
    } else {
      var result = blogController.accountmodel.value.data!.favoriteBlogIds!
          .where((element) => id == element);
      if (result.isEmpty) {
        return Colors.grey;
      } else {
        return Colors.pink;
      }
    }
  }

  buildGridItem(int index, BuildContext context, List<Datum> list) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.BLOG_DETAIL,arguments: list[index] );
      },
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
                      child:
                          Image.network(list[index].image!, fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          list[index].title!,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ))
                ],
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Obx(() {
                    return blogController.blogs.value.data == null
                        ? const Center()
                        : IconButton(
                            onPressed: () async {
                              await controller.addFavorite(list[index].id!);
                            },
                            icon: Icon(Icons.favorite,
                                color: setColor(list[index].id)),
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

  Padding buildCategoryBox(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: () {
          blogController.getBlogs(
              categoryId: controller.categories.value.data![index].id);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42.05.w,
              height: 10.78.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          controller.categories.value.data![index].image!)),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                controller.categories.value.data![index].title!,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ))
          ],
        ),
      ),
    );
  }

  Padding buildShimmer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42.05.w,
              height: 10.78.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.grey),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "",
                maxLines: 1,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
