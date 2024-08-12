import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livery/utils/app_theme.dart';

void successToast(String? message) {
  Fluttertoast.showToast(
      msg: message ?? '',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      // backgroundColor: AppTheme.themeData.primaryColor,
      // textColor: Colors.white,
      fontSize: 16.0);
}

void failureToast(String? message) {
  Fluttertoast.showToast(
      msg: message ?? '',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: appColors.cPrimary,
      textColor: Colors.white,
      fontSize: 16.0);
}
