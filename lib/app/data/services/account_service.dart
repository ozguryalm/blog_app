import 'package:blog/app/data/models/account_model.dart';
import 'package:blog/app/ui/global_widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AccountService {
  final baseUrl = "http://test020.internative.net";
  final box = GetStorage();
  Future getAccount() async {
    final String token = box.read("token");
    var headers = {
      'Authorization': token,
    };

    var res =
        await http.get(Uri.parse('$baseUrl/Account/Get'), headers: headers);
    if (res.statusCode != 200) {
      showToast("Connection error");
      return false;
    } else {
      try {
        return accountModelFromJson(res.body);
      } catch (e) {
        debugPrint(e.toString());
        return false;
      }
    }
  }
}
