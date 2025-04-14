import 'package:flutter/material.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/images/app_images.dart';
import 'package:super_cupertino_navigation_bar/super_cupertino_navigation_bar.dart';

buildSearchBar({
  required void Function(String)? searchFunction,
  required void Function() goToDoctorsPage,
  required void Function() goToFavouritePage,
  required TextEditingController searchController,
}) {
  return SuperAppBar(
    backgroundColor: AppColors.lightBlueColor,
    title: const Text(""),
    height: 10,
    alwaysShowTitle: false,
    largeTitle: SuperLargeTitle(enabled: false),
    searchBar: SuperSearchBar(
      searchController: searchController,
      onChanged: searchFunction,
      prefixIcon: Icon(Icons.filter_alt_outlined, color: AppColors.whiteColor),
      actions: [
        superActionWidget(
          function: goToDoctorsPage,
          imagePath: AppImages.doctorIcon,
          text: "Doctors",
        ),
        superActionWidget(
          function: goToFavouritePage,
          imagePath: AppImages.favoriteIcon,
          text: "Favourite",
        ),
      ],
      animationBehavior: SearchBarAnimationBehavior.steady,
      scrollBehavior: SearchBarScrollBehavior.pinned,
      height: 40,
      backgroundColor: AppColors.blueColor,
      cancelTextStyle: TextStyle(
        color: AppColors.blueColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
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
          children: [
            SizedBox(
              width: ScreenSize.screenWidth! * 0.04,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),

            Text(
              text,
              style: TextStyle(
                color: AppColors.blueColor,
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
