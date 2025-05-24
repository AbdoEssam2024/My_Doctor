import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/const/app_theme/text_styles.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/const/images/app_images.dart';
import 'package:my_doctor/view/core_widgets/pop_widget.dart';
import 'package:my_doctor/view/intro_screens/welcome_screen_widgets/welcome_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWidget(
      popAction: (didPop, res) {
        popFunc(didpop: didPop, result: exit(0));
      },

      childWidget: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: SizedBox.expand(
            child: Stack(
              children: [
                TweenAnimationBuilder(
                  tween: Tween<Alignment>(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  duration: Duration(seconds: 2),
                  builder: (context, value, child) => Container(
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    height: 180.h,
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.blueColor.withAlpha(100),
                          AppColors.whiteColor.withAlpha(100),
                        ],
                        begin: Alignment.topCenter,
                        end: value,
                        stops: [0.2, 0.9],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 60.h,
                  right: 0,
                  left: 0,
                  child: Image.asset(AppImages.welcomeLogo),
                ),

                Positioned(
                  bottom: 320.h,
                  right: 0,
                  left: 0,
                  child: Text(
                    textAlign: TextAlign.center,
                    "Find Trust Doctors",
                    style: TextStyles.font28Wieght500Blue,
                  ),
                ),

                Positioned(
                  bottom: 220.h,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 40.w,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                      style: TextStyles.font28Wieght500Blue!.copyWith(
                        fontSize: 14.sp,
                        height: 1.5.h,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 110.h,
                  right: 0,
                  left: 0,
                  child: WelcomeButtons(),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: TweenAnimationBuilder(
                    curve: Curves.easeInOut,
                    tween: Tween<Alignment>(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    duration: Duration(seconds: 2),
                    builder: (context, value, child) => Container(
                      width: double.infinity,
                      height: 120.h,
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.blueColor.withAlpha(100),
                            AppColors.whiteColor.withAlpha(100),
                          ],
                          begin: Alignment.bottomCenter,
                          end: value,
                          stops: [0.2, 0.9],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
