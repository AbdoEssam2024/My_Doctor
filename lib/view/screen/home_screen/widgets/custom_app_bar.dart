import 'package:flutter/material.dart';
import 'package:my_doctor/const/app_theme/app_theme.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/images/app_images.dart';
import 'package:my_doctor/controller/theme_controller.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

buildSearchBar({
  required void Function(String)? searchFunction,
  required void Function() goToDoctorsPage,
  required void Function() goToFavouritePage,
  required TextEditingController searchController,
  required ThemeController themeController,
}) {
  return SuperAppBar(
    title: const Text(""),
    height: 10,
    alwaysShowTitle: false,
    largeTitle: SuperLargeTitle(enabled: false),

    backgroundColor: themeController.changeThemeColors(
      dark: AppTheme.darkTheme.scaffoldBackgroundColor,
      light: AppTheme.lightTheme.scaffoldBackgroundColor,
    ),
    searchBar: SuperSearchBar(
      searchController: searchController,
      onChanged: searchFunction,
      prefixIcon: Icon(Icons.filter_alt_outlined, color: AppColors.whiteColor),
      actions: [
        superActionWidget(
          themeController: themeController,
          function: goToDoctorsPage,
          imagePath: AppImages.doctorIcon,
          text: "Doctors",
        ),
        superActionWidget(
          themeController: themeController,
          function: goToFavouritePage,
          imagePath: AppImages.favoriteIcon,
          text: "Favourite",
        ),
      ],
      animationBehavior: SearchBarAnimationBehavior.steady,
      scrollBehavior: SearchBarScrollBehavior.pinned,
      height: 40,
      backgroundColor: themeController.changeThemeColors(
        dark: AppTheme.darkTheme.colorScheme.secondary,
        light: AppTheme.lightTheme.colorScheme.primary,
      ),
      cancelTextStyle: TextStyle(
        color: themeController.changeThemeColors(
          dark: AppTheme.darkTheme.colorScheme.onPrimary,
          light: AppTheme.lightTheme.colorScheme.primary,
        ),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      enabled: true,
      cancelButtonText: "Cancel",

      placeholderText: "Search",
      placeholderTextStyle: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth! * 0.02),
    ),
  );
}

superActionWidget({
  required void Function() function,
  required String imagePath,
  required String text,
  required ThemeController themeController,
}) {
  return SuperAction(
    behavior: SuperActionBehavior.visibleOnUnFocus,
    child: GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenSize.screenWidth! * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              color: themeController.changeThemeColors(
                dark: AppTheme.darkTheme.colorScheme.surface,
                light: AppTheme.lightTheme.colorScheme.primary,
              ),
            ),

            Text(
              text,
              style: TextStyle(
                color: themeController.changeThemeColors(
                  dark: AppTheme.darkTheme.colorScheme.surface,
                  light: AppTheme.lightTheme.colorScheme.primary,
                ),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
