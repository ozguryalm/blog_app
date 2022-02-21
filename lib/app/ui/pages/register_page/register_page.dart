import 'package:lottie/lottie.dart';
import '../../../translation/texts.dart';
import '../../global_widgets/default_button.dart';
import '../../layouts/main/widgets/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayoutView(
        title: register.tr,
        child: Form(
          key: controller.registerformKey,
          child: ListView(
            children: [
              SizedBox(height: 3.80.h),
              SizedBox(
                width: 44.61.w,
                height: 44.61.w,
                child: LottieBuilder.asset("assets/lotties/register.json"),
              ),
              SizedBox(height: 3.80.h),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (text) => controller.validateEmail(text!),
                style: Theme.of(context).textTheme.titleMedium,
                cursorWidth: 1,
                controller: controller.email_controller,
                autofillHints: const [AutofillHints.email],
                decoration: InputDecoration(
                    labelText: email.tr,
                    prefixIcon: SizedBox(
                      height: 6.63.h,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Image.asset(
                          "assets/icons/mail.png",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 1.89.h),
              Obx(() {
                return TextFormField(
                   validator: (value) => controller.validatePassword(value!),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: controller.passwordVisible.value,
                  style: Theme.of(context).textTheme.titleMedium,
                  cursorWidth: 1,
                  controller: controller.password_controller,
                  autofillHints: const [AutofillHints.email],
                  decoration: InputDecoration(
                      labelText: password.tr,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.changePasswordVisible();
                        },
                        icon: SizedBox(
                          height: 6.63.h,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                                "assets/icons/visible_password.png"),
                          ),
                        ),
                      ),
                      prefixIcon: SizedBox(
                        height: 6.63.h,
                        child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Image.asset(
                              "assets/icons/lock.png",
                            )),
                      )),
                );
              }),
              SizedBox(height: 1.89.h),
              Obx(() {
                return TextFormField(
                  validator: (value) => controller.validatePassword(value!),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: controller.passwordVisible.value,
                  style: Theme.of(context).textTheme.titleMedium,
                  cursorWidth: 1,
                  controller: controller.password_retry_controller,
                  autofillHints: const [AutofillHints.email],
                  decoration: InputDecoration(
                      labelText: repassword.tr,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.changePasswordVisible();
                        },
                        icon: SizedBox(
                          height: 6.63.h,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                                "assets/icons/visible_password.png"),
                          ),
                        ),
                      ),
                      prefixIcon: SizedBox(
                        height: 6.63.h,
                        child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Image.asset(
                              "assets/icons/lock.png",
                            )),
                      )),
                );
              }),
              SizedBox(height: 3.80.h),
              Obx(() {
                return DefaultButton(
                  loadingWidget: controller.isloading.value
                      ? const CircularProgressIndicator(
                          color: Colors.grey,
                        )
                      : null,
                  filled: false,
                  text: "Register",
                  oneTap: () async {
                    controller.checkValid().then((value) async {
                      if (value) {
                        if (controller.isloading.value) {
                        } else {
                          await controller.registerFunction();
                        }
                      } else {}
                    });
                  },
                );
              }),
              SizedBox(height: 1.89.h),
              DefaultButton(
                filled: true,
                text: "Login",
                oneTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        ));
  }
}
