import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/pop_func.dart';
import 'package:my_doctor/const/images/app_images.dart';
import 'package:my_doctor/controller/splash_controller.dart';
import 'package:my_doctor/view/core_widgets/pop_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenSize.init(context);
    Get.put(SplashController());
    return PopScopeWidget(
      popAction: (didPop, res) {
        popFunc(didpop: didPop, result: exit(0));
      },

      childWidget: Scaffold(
        backgroundColor: AppColors.blueColor,
        body: SizedBox(
          width: ScreenSize.screenWidth,
          child: GetBuilder<SplashController>(
            builder:
                (controller) => AnimatedOpacity(
                  onEnd: () {
                    controller.goToWelcomeScreen();
                  },
                  duration: Duration(seconds: 5),
                  curve: Curves.easeInOut,
                  opacity: controller.viewOpacity,
                  child: Column(
                    spacing: ScreenSize.screenWidth! * 0.1,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.splashLogo),
                      Text(
                        "Welcome To\nMyDoctor",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
