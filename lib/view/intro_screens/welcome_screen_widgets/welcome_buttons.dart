import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/navigation_extenstion.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/view/core_widgets/custom_btn.dart';

class WelcomeButtons extends StatelessWidget {
  const WelcomeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        SizedBox(
          width: 200.w,
          child: CustomBtn(
            btnColor: AppColors.blueColor,
            text: "Get Started",
            btnFunc:
                () => context.pushNameAndRemove(routeName: AppRoutesNames.loginScreen),
          ),
        ),
        CustomBtn(
          btnColor: AppColors.whiteColor,
          textColor: AppColors.blueColor,
          text: "Sign Up",
          btnFunc: () => context.pushNameAndRemove(routeName: AppRoutesNames.signupScreen),
        ),
      ],
    );
  }
}
