import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/const/images/app_images.dart';
import 'package:my_doctor/const/routes/routes_names.dart';
import 'package:my_doctor/view/core_widgets/custom_text.dart';
import 'package:my_doctor/view/core_widgets/pop_widget.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    String message = Get.arguments['message'];

    return PopScopeWidget(
      popAction: (didpop, p1) {
        popFunc(
          didpop: didpop,
          result: Get.offNamed(AppRoutesNames.loginScreen),
        );
      },
      childWidget: Scaffold(
        body: SizedBox(
          width: ScreenSize.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: ScreenSize.screenHeight! * 0.04,
            children: [
              Image.asset(AppImages.success),
              Column(
                spacing: ScreenSize.screenHeight! * 0.005,
                children: [
                  CustomText(
                    text: "Successful",
                    size: 24,
                    weight: FontWeight.w500,
                    textColor: AppColors.blueColor,
                  ),
                  CustomText(
                    text: message,
                    size: 12,
                    weight: FontWeight.w400,
                    textColor: AppColors.blackColor,
                  ),
                ],
              ),
              MaterialButton(
                color: AppColors.blueColor,
                textColor: AppColors.whiteColor,
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenWidth! * 0.3,
                  vertical: ScreenSize.screenHeight! * 0.02,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  Get.offAllNamed(AppRoutesNames.loginScreen);
                },
                child: CustomText(
                  text: "Continue",
                  size: 16,
                  weight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
