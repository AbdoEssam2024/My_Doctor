import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/const/images/app_images.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/view/core_widgets/custom_btn.dart';
import 'package:my_doctor/view/core_widgets/pop_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return PopScopeWidget(
      popAction: (didPop, res) {
        popFunc(didpop: didPop, result: exit(0));
      },

      childWidget: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Container(
          margin: EdgeInsets.only(top: ScreenSize.screenWidth! * 0.3),
          width: ScreenSize.screenWidth,
          child: Column(
            spacing: ScreenSize.screenWidth! * 0.3,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                spacing: ScreenSize.screenWidth! * 0.09,
                children: [
                  Image.asset(AppImages.welcomeLogo),
                  Text(
                    "MyDoctor",
                    style: TextStyle(
                      color: AppColors.blueColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: ScreenSize.screenWidth! * 0.05,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.screenWidth! * 0.1,
                    ),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  CustomBtn(
                    btnColor: AppColors.blueColor,
                    text: "Log in",
                    btnFunc: () => Navigator.pushNamed(context, AppRoutesNames.loginScreen),
                  ),
                  CustomBtn(
                    btnColor: AppColors.whiteColor,
                    textColor: AppColors.blueColor,
                    text: "Sign Up",
                    btnFunc: () => Navigator.pushNamed(context, AppRoutesNames.signupScreen),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
