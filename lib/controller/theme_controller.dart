import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/app_theme/app_theme.dart';
import 'package:my_doctor/main.dart';

class ThemeController extends GetxController {
  RxBool isLightMode = true.obs;

  static ThemeData initialTheme =
      themeBox.get("theme") == "dark"
          ? AppTheme.darkTheme
          : AppTheme.lightTheme;

  void getInitialTheme() {
    // Initialize the theme state based on saved value
    final savedTheme = themeBox.get("theme");
    if (savedTheme == "dark") {
      isLightMode.value = false;
      Get.changeTheme(AppTheme.darkTheme);
    } else {
      isLightMode.value = true;
      Get.changeTheme(AppTheme.lightTheme);
    }
  }

  Color changeThemeColors({required Color dark, required Color light}) {
    return isLightMode.value ? light : dark;
  }

  void changeAppTheme() {
    isLightMode.value = !isLightMode.value;
    if (isLightMode.value) {
      Get.changeTheme(AppTheme.lightTheme);
      themeBox.put("theme", "light");
    } else {
      Get.changeTheme(AppTheme.darkTheme);
      themeBox.put("theme", "dark");
    }
  }

  @override
  void onReady() {
    getInitialTheme();
    super.onReady();
  }
}
