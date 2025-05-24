import 'package:flutter/material.dart';
import 'package:my_doctor/const/app_theme/text_styles.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/view/core_widgets/custom_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget signupActions({required void Function() goToLogin ,required void Function() signUpFunc}) {
  return Column(
    spacing: 30.h,
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
            style: TextStyles.font18Wieght600Blue,
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
            style: TextStyles.font14Wieght400Grey,
          ),
          TextButton(
            onPressed: goToLogin,
            child: Text(
              "Log In",
              style: TextStyles.font18Wieght600Blue,
            ),
          ),
        ],
      ),
    ],
  );
}
