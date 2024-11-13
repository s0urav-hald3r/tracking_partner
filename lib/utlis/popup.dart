import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tracking_partner/config/constants.dart';

class TPopup {
  /// Displays a success snackbar with a custom title and message.
  static successSnackbar({required String message}) {
    Get.snackbar(
      'Success',
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.black54,
      backgroundColor: Colors.greenAccent,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      icon: const Icon(Icons.thumb_up, color: Colors.black54),
    );
  }

  /// Displays a warning snackbar with a custom title and message.
  static warningSnackbar({required String message}) {
    Get.snackbar(
      'Warning',
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.black54,
      backgroundColor: primaryColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      icon: const Icon(Icons.warning, color: Colors.black54),
    );
  }

  /// Displays an error snackbar with a custom title and message.
  static errorSnackbar({required String message}) {
    Get.snackbar(
      'Error',
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      icon: const Icon(Icons.gpp_bad, color: Colors.white),
    );
  }
}
