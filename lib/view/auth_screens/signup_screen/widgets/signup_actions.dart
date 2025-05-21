import 'package:flutter/material.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/view/core_widgets/custom_btn.dart';

Widget signupActions({required void Function() goToLogin ,required void Function() signUpFunc}) {
  return Column(
    spacing: ScreenSize.screenWidth! * 0.05,
    children: [
      CustomBtn(
        btnColor: AppColors.blueColor,
        text: "Sign Up",
        btnFunc: signUpFunc,
      ),

      Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColors.blueColor,
              endIndent: 10,
              thickness: 2,
            ),
          ),
          Text(
            "Or",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          Expanded(
            child: Divider(
              color: AppColors.blueColor,
              indent: 10,
              thickness: 2,
            ),
          ),
        ],
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already Have Account ?",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          TextButton(
            onPressed: goToLogin,
            child: Text(
              "Log In",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.blueColor,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
