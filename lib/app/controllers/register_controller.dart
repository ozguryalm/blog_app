// ignore_for_file: non_constant_identifier_names

import 'package:blog/app/data/services/login_register_service.dart';
import 'package:blog/app/routes/app_routes.dart';
import 'package:blog/app/translation/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  final box = GetStorage();
  RxBool passwordVisible = true.obs;
  RxBool isloading = false.obs;
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController password_retry_controller = TextEditingController();
  final GlobalKey<FormState> registerformKey = GlobalKey<FormState>();

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
    } else if (password_controller.text != password_retry_controller.text) {
      return passwordMatchValidateMessage;
    }
    return null;
  }

  Future<bool> checkValid() async {
    final isValid = registerformKey.currentState!.validate();
    if (!isValid) {
      return false;
    } else {
      registerformKey.currentState!.save();
      return true;
    }
  }

  Future registerFunction() {
    changeLoadingState();
    return LoginAndRegisterService()
        .register(
            email: email_controller.text,
            password: password_controller.text,
            passwordRetry: password_retry_controller.text)
        .then((value) {
      changeLoadingState();

      if (value.hasError!) {
      } else {
        box.write("token", "Bearer ${value.data!.token}");
        Get.offAllNamed(AppRoutes.HOME);
      }
      return value;
    });
  }
}
