import 'package:flutter/material.dart';
import 'package:my_doctor/const/colors/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.lightBlueColor,
    hintColor: AppColors.whiteColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.blueColor,
      onPrimary: AppColors.blueColor,
      secondary: AppColors.mediumBlueColor,
      onSecondary: AppColors.whiteColor,
      error: AppColors.redColor,
      onError: AppColors.greyColor,
      surface: AppColors.lightBlueColor,
      onSurface: AppColors.whiteColor,
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.blackColor,
    hintColor: AppColors.whiteColor,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.blackColor,
      onPrimary: AppColors.whiteColor,
      secondary: AppColors.mediumBlueColor,
      onSecondary: AppColors.whiteColor,
      error: AppColors.redColor,
      onError: AppColors.redColor,
      surface: AppColors.lightBlueColor,
      onSurface: AppColors.whiteColor,
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.mediumBlueColor),
  );
}
