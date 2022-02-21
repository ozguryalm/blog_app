// ignore_for_file: non_constant_identifier_names

import 'package:blog/app/routes/app_routes.dart';
import 'package:blog/app/translation/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/services/login_register_service.dart';

class LoginController extends GetxController {
  final box = GetStorage();

  RxBool isloading = false.obs;
  RxBool passwordVisible = true.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

   TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  void changePasswordVisible() {
    passwordVisible.value = !passwordVisible.value;
  }

  void changeLoadingState() {
    isloading.value = !isloading.value;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return mailValidateMessage;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return passwordValidateMessage;
    }
    return null;
  }

  Future<bool> checkValid() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    } else {
      loginFormKey.currentState!.save();
      return true;
    }
  }

  Future loginFunction() {
    changeLoadingState();
    return LoginAndRegisterService()
        .login(
      email: email_controller.text,
      password: password_controller.text,
    )
        .then((value) {
      changeLoadingState();
      if (value.data != null) {
        box.write("token", "Bearer ${value.data!.token}");
        
        Get.offAndToNamed(AppRoutes.MAIN);
      }
      return value;
    });
  }
}
