import 'dart:math' as math;

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/const/app_theme/app_theme.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/controller/theme_controller.dart';
import 'package:my_doctor/repo/const_data/home_overview_data.dart';

Widget customBottomNavigationBar({
  required void Function(int) navigationFunction,
  required ThemeController themeController,
  required NotchBottomBarController notchBottomBarController,
}) {
  return AnimatedNotchBottomBar(
    
    durationInMilliSeconds: 500,

    bottomBarItems: bottomBarItems,
    onTap: navigationFunction,
    notchBottomBarController: notchBottomBarController,
    kIconSize: 30.0,
    topMargin: 7.0,
    circleMargin: 10.0,
    kBottomRadius: 20.0,
    
    // topMargin: 7.0,
    
    // removeMargins: true,
    color: themeController.changeThemeColors(
      dark: AppTheme.darkTheme.colorScheme.primary,
      light: AppTheme.lightTheme.colorScheme.onPrimary,
    ),

  );
}

class BottomBarItems extends StatelessWidget {
  final IconData icon;
  const BottomBarItems({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenSize.screenHeight! * 0.002),
      child: Icon(icon, color: AppColors.whiteColor, size: 35),
    );
  }
}
