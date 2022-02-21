import 'dart:convert';
import '../models/blog_model.dart';
import '../models/categories_model.dart';
import '../../ui/global_widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class BlogService {
  final baseUrl = "http://test020.internative.net";
  final box = GetStorage();
  BlogService() : super();

  Future<dynamic> getBlogs({String? categoryId}) async {
     String token = box.read("token");
    Map<String, String> headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    var data = {"CategoryId": categoryId};

    var res = await http.post(Uri.parse('$baseUrl/Blog/GetBlogs'),
        headers: headers, body: jsonEncode(data));
    if (res.statusCode != 200) {
      debugPrint(res.statusCode.toString());
      return false;
    } else {
      try {
        return blogsModelFromJson(res.body);
      } catch (e) {
        return false;
      }
    }
  }

  Future<dynamic> getCategories() async {
    final String token = box.read("token");

    var headers = {
      'Authorization': token,
    };

    var res = await http.get(Uri.parse('$baseUrl/Blog/GetCategories'),
        headers: headers);
    if (res.statusCode != 200) {
      return false;
    } else {
      try {
        return categoriesModelFromJson(res.body);
      } catch (e) {
        debugPrint(e.toString());
        return false;
      }
    }
  }

  Future addFavorite(String blogId) async {
    final String token = box.read("token");

    var headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    var data = {"Id": blogId};

    var res = await http.post(Uri.parse('$baseUrl/Blog/ToggleFavorite'),
        headers: headers, body: jsonEncode(data));
    if (res.statusCode != 200) {
      showToast("Connection error");
    } else {
      try {
        Map data = Map.from(jsonDecode(res.body));
        showToast(data["Message"]);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
