import '../../../routes/app_routes.dart';

import '../../global_widgets/default_button.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
        title: "My Profile",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 24.w,
              backgroundColor: Colors.grey,
            ),
            Column(
              children: [
                DefaultButton(
                  filled: false,
                  text: "Save",
                  oneTap: () {},
                ),
                SizedBox(height: 1.89.h),
                DefaultButton(
                  filled: true,
                  text: "Log Out",
                  oneTap: () {
                    controller.box.remove("token");
                    Get.offAllNamed(AppRoutes.LOGIN);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
