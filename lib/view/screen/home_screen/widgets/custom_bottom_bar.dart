import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/repo/const_data/home_overview_data.dart';

Widget customBottomNavigationBar({
  required void Function(int)? navigationFunction,
}) {
  return ConvexAppBar.badge(
    {0: "Home", 1: "Chat", 2: "Profile", 3: "Dates"},
    badgeMargin: EdgeInsets.only(
      bottom: ScreenSize.screenHeight! * 0.04,
    ),
    badgeColor: AppColors.blueColor,
    height: ScreenSize.screenHeight! * 0.065,
    items: bottomBarItems,
    backgroundColor: AppColors.mediumBlueColor,
    activeColor: AppColors.blackColor,
    curve: Curves.easeInOut,
    top: -20,
    style: TabStyle.flip,
    onTap: navigationFunction,
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


