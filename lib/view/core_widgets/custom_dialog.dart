import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:my_doctor/const/colors/app_colors.dart';

Future<void> customDialog({
  required BuildContext context,
  required String body,
}) {
  return AwesomeDialog(
    context: context,
    dialogBackgroundColor: AppColors.blackColor,
    body: Text(
      body,
      style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
    ),
    dialogType: DialogType.error,
    autoHide: const Duration(seconds: 2),
  ).show();
}