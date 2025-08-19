import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum SnackType { success, error, warning }

class SnackBarModel {
  static void show({
    required String title,
    required String message,
    required SnackType type,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color bgColor;
    switch (type) {
      case SnackType.success:
        bgColor = Colors.green;
        break;
      case SnackType.error:
        bgColor = Colors.red;
        break;
      case SnackType.warning:
        bgColor = Colors.orange;
        break;
    }

    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: bgColor,
      colorText: Colors.white,
      duration: duration,
      titleText: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
