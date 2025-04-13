import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/images/app_images.dart';

class MainHeader extends StatelessWidget {
  final String userName;
  final void Function()? notificationsFunction;
  final void Function()? settingsFunction;
  final void Function()? profileTapFunction;

  const MainHeader({
    super.key,
    required this.userName,
    required this.notificationsFunction,
    required this.settingsFunction,
    required this.profileTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.screenWidth! * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: profileTapFunction,
            child: Row(
              spacing: ScreenSize.screenWidth! * 0.05,
              children: [
                Image.asset(AppImages.userImage),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi , Welcome Back",
                      style: TextStyle(
                        color: AppColors.blueColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      userName.toString().capitalize!,
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            spacing: ScreenSize.screenWidth! * 0.02,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.lightBlueColor,
                ),
                child: IconButton(
                  onPressed: notificationsFunction,
                  icon: Icon(Icons.notifications_outlined),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.lightBlueColor,
                ),
                child: IconButton(
                  onPressed: settingsFunction,
                  icon: Icon(Icons.settings_rounded),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
