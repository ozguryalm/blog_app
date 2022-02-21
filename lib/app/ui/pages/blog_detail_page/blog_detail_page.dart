import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';

import '../../../data/models/blog_model.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/blog_detail_controller.dart';

class BlogDetailPage extends GetView<BlogDetailController> {
  BlogDetailPage({Key? key}) : super(key: key);

  htmlparse(String texxt) {
    var unescape = HtmlUnescape();
    var textt = unescape.convert(texxt);

    var a = Html(
      data: textt,
    );
    return a;
  }

  Datum value = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
      leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          )),
      title: "Blog App",
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
              padding:const EdgeInsets.all(18),
              child: Column(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Hero(
                        tag: value.image!,
                        child: Container(
                          width: 42.05.w,
                          height: 10.78.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(value.image!)),
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: htmlparse(value.content!),
                    color: Colors.grey,
                  )
                ],
              ))),
    );
  }
}
