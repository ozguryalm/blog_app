import 'dart:async';
import 'dart:convert';
import 'package:blog/app/ui/utils/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:blog/app/data/models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../ui/global_widgets/toast_message.dart';

class LoginAndRegisterService {
 

  final baseUrl = "http://test020.internative.net";
  LoginAndRegisterService() : super();

  Future<RegisterModel> register(
      {required String email,
      required String password,
      required String passwordRetry}) async {
    RegisterModel registermodel = RegisterModel();
    var headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };

    Map data = {
      "Email": email,
      "Password": password,
      "PasswordRetry": passwordRetry
    };
    var res;
    try {
      res = await http
          .post(Uri.parse('$baseUrl/Login/SignUp'),
              headers: headers, body: jsonEncode(data))
          .timeout(
        const Duration(seconds: 3),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          throw TimeoutException(
              'The connection has timed out, Please try again!'); // Request Timeout response status code
        },
      );
    } on TimeoutException catch (e) {
      showToast("Bağlantı zaman aşımına uğradı.");
    }

    if (res.statusCode != 200) {
      throw Exception(
          'http.post error: statusCode= ${res.statusCode} \n ${res.body}');
    } else {
      try {
        registermodel = registerModelFromJson(res.body);
        if (registermodel.hasError == true) {
          showToast(registermodel.message);
        } else {
          debugPrint(registermodel.message);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return registermodel;
  }

 
  Future<RegisterModel> login(
      {required String email,
      required String password,
      }) async {
    RegisterModel registermodel = RegisterModel();
    var headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };

    Map data = {
      "Email": email,
      "Password": password,
    };
    var res;
    try {
      res = await http
          .post(Uri.parse('$baseUrl/Login/SignIn'),
              headers: headers, body: jsonEncode(data))
          .timeout(
        const Duration(seconds: 3),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          throw TimeoutException(
              'The connection has timed out, Please try again!'); // Request Timeout response status code
        },
      );
    } on TimeoutException catch (e) {
      showToast("Bağlantı zaman aşımına uğradı.");
    }

    if (res.statusCode != 200) {
      throw Exception(
          'http.post error: statusCode= ${res.statusCode} \n ${res.body}');
    } else {
      try {
        registermodel = registerModelFromJson(res.body);
        if (registermodel.hasError == true) {
          showToast(registermodel.message);
        } else {
          debugPrint(registermodel.message);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return registermodel;
  }

 
}
