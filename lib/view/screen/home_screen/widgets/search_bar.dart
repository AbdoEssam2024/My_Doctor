import 'package:flutter/material.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/images/app_images.dart';

class CustomSearchBar extends StatelessWidget {
  final void Function() searchFunction;
  final void Function() filterFunction;
  final void Function() doctorsFunction;
  final void Function() favouriteFunction;
  final TextEditingController searchController;
  const CustomSearchBar({
    super.key,
    required this.searchFunction,
    required this.filterFunction,
    required this.searchController,
    required this.doctorsFunction,
    required this.favouriteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenSize.screenWidth! * 0.08),
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth! * 0.03),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(right: ScreenSize.screenWidth! * 0.03),
            child: GestureDetector(
              onTap: doctorsFunction,
              child: Column(
                children: [
                  SizedBox(
                    width: ScreenSize.screenWidth! * 0.06,
                    child: Image.asset(AppImages.doctorIcon, fit: BoxFit.cover),
                  ),

                  Text(
                    "Doctors",
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

          Container(
            margin: EdgeInsets.only(right: ScreenSize.screenWidth! * 0.03),
            child: GestureDetector(
              onTap: favouriteFunction,
              child: Column(
                children: [
                  SizedBox(
                    width: ScreenSize.screenWidth! * 0.07,
                    child: Image.asset(
                      AppImages.favoriteIcon,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Text(
                    "Favourite",
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

          Expanded(
            child: TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              controller: searchController,
              decoration: InputDecoration(
                suffixIcon: Container(
                  margin: EdgeInsets.only(
                    right: ScreenSize.screenWidth! * 0.015,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: searchFunction,
                    icon: Icon(Icons.search, color: AppColors.blueColor),
                  ),
                ),

                prefixIcon: Container(
                  margin: EdgeInsets.only(
                    left: ScreenSize.screenWidth! * 0.015,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: filterFunction,
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: AppColors.blueColor,
                    ),
                  ),
                ),
                filled: true,
                fillColor: AppColors.blueColor,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),

                contentPadding: EdgeInsets.symmetric(
                  vertical: ScreenSize.screenWidth! * 0.04,
                  horizontal: ScreenSize.screenWidth! * 0.15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
