import 'package:flutter/material.dart';
import 'package:livery/utils/app_colors.dart';

class LiveryStyles {
  static TextStyle profileName() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    );
  }

  static TextStyle date() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    );
  }

  static TextStyle description() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    );
  }

  static TextStyle liveryName() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    );
  }
}
