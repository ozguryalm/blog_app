import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/constants.dart';

void showToast(message) {
  Fluttertoast.showToast(
    textColor: defaultColor,
    backgroundColor: Colors.white,
    msg: message, // message
    toastLength: Toast.LENGTH_SHORT, // length
    gravity: ToastGravity.BOTTOM, // location
    // duration
  );
}
