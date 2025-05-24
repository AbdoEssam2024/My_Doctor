import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doctor/const/colors/app_colors.dart';
import 'package:my_doctor/const/functions/navigation_extenstion.dart';
import 'package:my_doctor/const/images/app_images.dart';
import 'package:my_doctor/const/routes/routes_names.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueColor,
      body: SizedBox.expand(
        child: Stack(
          children: [
            TweenAnimationBuilder(
              tween: Tween<Alignment>(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              duration: Duration(seconds: 2),
              builder:
                  (context, value, child) => Container(
                    width: double.infinity,
                    height: double.infinity,
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.whiteColor.withAlpha(100),
                          AppColors.blueColor.withAlpha(100),
                        ],
                        begin: Alignment.topCenter,
                        end: value,
                        stops: [0.01, 0.9],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.blueColor,
                      shape: BoxShape.rectangle,
                    ),
                  ),
              curve: Curves.easeInOut,
            ),

            Center(
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: Duration(seconds: 4),
                builder:
                    (context, value, child) => Opacity(
                      opacity: value,
                      child: Image.asset(AppImages.splashLogo),
                    ),

                onEnd: () {
                  context.pushNameAndRemove(routeName: AppRoutesNames.welcomeScreen);
                },
              ),
            ),

            Positioned(
              bottom: 300.h,
              right: 0,
              left: 0,
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
