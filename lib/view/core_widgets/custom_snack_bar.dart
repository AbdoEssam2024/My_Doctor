import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/colors/app_colors.dart';

snackBarWidget({
  required String title,
  required String message,
  Color backgroundColor = Colors.red,
}) {
  Get.snackbar(
    "",
    "",
    animationDuration: Duration(seconds: 1),
    backgroundColor: backgroundColor,
    messageText: Text(
      message,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
    titleText: Text(
      title,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}
