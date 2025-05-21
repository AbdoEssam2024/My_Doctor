import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_doctor/const/class/screen_size.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/images/app_images.dart';
import 'package:my_doctor/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    final controller = Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppColors.blueColor,
      body: SizedBox.expand(
        child: Column(
          spacing: ScreenSize.screenWidth! * 0.1,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 2),
              builder:
                  (context, value, child) => Opacity(
                    opacity: value,
                    child: Image.asset(AppImages.splashLogo),
                  ),

              onEnd: () {
                controller.goToWelcomeScreen();
              },
            ),

            Center(
              child: Text(
                "Welcome To MyDoctor",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
